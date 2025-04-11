import 'package:app_template/app/common/constants/app_theme_data.dart';
import 'package:app_template/app/common/functions/app_functions.dart';
import 'package:app_template/app/common/get_it/get_it.dart';
import 'package:app_template/app/features/presentation/splash/view/splash_view.dart';
import 'package:app_template/app/features/presentation/test/cubit/test_cubit.dart';
import 'package:app_template/core/helpers/navigation_helper/navigation_helper.dart';
import 'package:app_template/core/keys/keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await AppFunctions.instance.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<TestCubit>(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: Navigation.navigationKey,
        scaffoldMessengerKey: AppKeys.scaffoldMessengerKey,
        theme: AppThemeData.themeData,
        home: const SplashView(),
      ),
    );
  }
}
