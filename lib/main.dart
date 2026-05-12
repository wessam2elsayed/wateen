import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:wateen/core/services/get_it_services.dart';
import 'package:wateen/wateen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  await Hive.openBox('settings');
  await Hive.openBox('prayersBox');
  await Hive.openBox('azkarBox');
  await Hive.openBox('quranBox');
  await Hive.openBox('habitBox');
  GetItServices.setUp();
  runApp(const Wateen());
}


