import 'package:doza_flutter/enums/constants.dart';
import 'package:doza_flutter/ui/screens/auth/view_models/utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/export.dart';

Future<({RSAPublicKey publicKey, RSAPrivateKey privateKey})>
    generateKeys() async {
  final FlutterSecureStorage storage = FlutterSecureStorage();

  final keyPair = generateRSAkeyPair(secureRandom());

  await storage.write(
    key: ConstantsEnum.privateKey.value,
    value: encodePrivateKey(keyPair.privateKey),
  );
  await storage.write(
    key: ConstantsEnum.publicKey.value,
    value: encodePublicKey(keyPair.publicKey),
  );
  return (publicKey: keyPair.publicKey, privateKey: keyPair.privateKey);
}
