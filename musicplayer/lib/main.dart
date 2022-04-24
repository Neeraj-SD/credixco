import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicplayer/screens/details_screen.dart';
import 'package:musicplayer/screens/home_screen.dart';
import './injection_container.dart' as di;
import 'cubit/details_cubit.dart';
import 'cubit/homepage_cubit.dart';
import 'cubit/internet_cubit.dart';
import 'utils/router/app_router.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<HomepageCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<DetailsCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<InternetCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: di.sl<AppRouter>().onGenerateRoute,
        home: const HomeScreen(),
      ),
    );
  }
}
