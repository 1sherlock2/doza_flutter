import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey> generateRSAkeyPair(
  SecureRandom secureRandom, {
  int bitLenght = 2048,
}) {
  final keyGen = RSAKeyGenerator()
    ..init(
      ParametersWithRandom(
        RSAKeyGeneratorParameters(BigInt.parse('65537'), bitLenght, 64),
        secureRandom,
      ),
    );

  final pair = keyGen.generateKeyPair();
  final publicKey = pair.publicKey;
  final privateKey = pair.privateKey;
  return AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>(publicKey, privateKey);
}

SecureRandom secureRandom() {
  final random = FortunaRandom();
  final seedSource = Random.secure();
  final seeds = <int>[];
  for (int i = 0; i < 32; i++) {
    seeds.add(seedSource.nextInt(255));
  }
  random.seed(KeyParameter(Uint8List.fromList(seeds)));
  return random;
}

String encodePublicKey(RSAPublicKey key) {
  final asn1 = ASN1Sequence()
    ..add(ASN1Integer(key.modulus!))
    ..add(ASN1Integer(key.exponent!));
  return base64Encode(asn1.encode());
}

String encodePrivateKey(RSAPrivateKey key) {
  final asn1 = ASN1Sequence()
    ..add(ASN1Integer(BigInt.zero)) // version
    ..add(ASN1Integer(key.modulus!))
    ..add(ASN1Integer(key.publicExponent!))
    ..add(ASN1Integer(key.privateExponent!))
    ..add(ASN1Integer(key.p!))
    ..add(ASN1Integer(key.q!))
    ..add(ASN1Integer(key.privateExponent! % (key.p! - BigInt.one)))
    ..add(ASN1Integer(key.privateExponent! % (key.q! - BigInt.one)))
    ..add(ASN1Integer(key.q!.modInverse(key.p!)));
  return base64Encode(asn1.encode());
}

RSAPublicKey decodePublicKey(String encoded) {
  final seq = ASN1Parser(base64Decode(encoded)).nextObject() as ASN1Sequence;
  return RSAPublicKey(
    (seq.elements![0] as ASN1Integer).integer!,
    (seq.elements![1] as ASN1Integer).integer!,
  );
}

RSAPrivateKey decodePrivateKey(String encoded) {
  final seq = ASN1Parser(base64Decode(encoded)).nextObject() as ASN1Sequence;
  final elements = seq.elements!;
  return RSAPrivateKey(
    (elements[1] as ASN1Integer).integer!, // modulus
    (elements[3] as ASN1Integer).integer!, // privateExponent
    (elements[4] as ASN1Integer).integer!, // p
    (elements[5] as ASN1Integer).integer!, // q
  );
}

String rsaDecrypt(String encryptedBase64, RSAPrivateKey privateKey) {
  final cipher = PKCS1Encoding(RSAEngine())
    ..init(false, PrivateKeyParameter<RSAPrivateKey>(privateKey));

  final encryptedBytes = base64Decode(encryptedBase64);
  final decryptedByres = cipher.process(encryptedBytes);
  return utf8.decode(decryptedByres);
}

RSAPublicKey derivePublicKey(RSAPrivateKey privateKey) {
  return RSAPublicKey(privateKey.modulus!, privateKey.publicExponent!);
}

String decryptAuthPayload(String base64Payload, RSAPrivateKey privateKey) {
  final bytes = base64Decode(base64Payload);

  // 1. Разбиваем на части
  final encryptedKey = bytes.sublist(0, 256);
  final iv = bytes.sublist(256, 272);
  final encryptedData = bytes.sublist(272);

  // 2. RSA расшифровываем AES-ключ
  final rsaCipher = PKCS1Encoding(RSAEngine())
    ..init(false, PrivateKeyParameter<RSAPrivateKey>(privateKey));
  final aesKey = rsaCipher.process(Uint8List.fromList(encryptedKey));

  // 3. AES-256-CBC расшифровываем данные
  final aesCipher = CBCBlockCipher(AESEngine())
    ..init(
      false,
      ParametersWithIV(KeyParameter(aesKey), Uint8List.fromList(iv)),
    );

  final decrypted = Uint8List(encryptedData.length);
  for (var offset = 0; offset < encryptedData.length; offset += 16) {
    aesCipher.processBlock(
      Uint8List.fromList(encryptedData),
      offset,
      decrypted,
      offset,
    );
  }

  // 4. Убираем PKCS7 padding
  final padLen = decrypted.last;
  final result = decrypted.sublist(0, decrypted.length - padLen);
  return utf8.decode(result);
}
