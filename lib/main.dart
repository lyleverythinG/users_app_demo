import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_demo/core/constants/constants.dart';
import 'package:users_app_demo/features/home/data/repository/users_repo.dart';
import 'package:users_app_demo/features/home/presentation/bloc/bloc/users_bloc.dart';
import 'package:users_app_demo/features/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const UsersAppDemo());
}

class UsersAppDemo extends StatelessWidget {
  const UsersAppDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UsersRepo(),
      child: BlocProvider(
        create: (context) =>
            UsersBloc(usersRepo: RepositoryProvider.of<UsersRepo>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.usersAppDemoTxt,
          theme: Constants.usersTheme,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
