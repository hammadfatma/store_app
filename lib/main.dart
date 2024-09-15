import 'package:flutter/material.dart';
import 'package:store_app/core/di/dependency_injection.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(
    StoreApp(
      appRouter: AppRouter(),
    ),
  );
}
