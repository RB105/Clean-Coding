import 'package:clean_architecture/data/repository/home_repository.dart';
import 'package:clean_architecture/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'cubit/home_state.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  HomeRepository.registerAdapters();
  await Hive.initFlutter();
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  MaterialApp build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
