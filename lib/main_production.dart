import 'package:doza_flutter/core/providers.dart';
import 'package:doza_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: '.production.env');
  await initializeDateFormatting('ru', null); // инициализация русской локали

  runApp(MultiProvider(providers: await providers, child: MainApp()));
}
