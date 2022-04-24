import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicplayer/screens/details_screen.dart';
import 'package:musicplayer/screens/home_screen.dart';
import './injection_container.dart' as di;
import 'cubit/details_cubit.dart';
import 'cubit/homepage_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<HomepageCubit>(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
