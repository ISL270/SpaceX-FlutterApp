import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Presentation_layer/bottom_navbar.dart';
import 'Services/globals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Logic_layer/Launches/launches_bloc.dart';
import '../../Data_layer/repositories/launches_repository.dart';
import '../../Services/spacex_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LaunchesBloc>(
      create: (context) =>
          LaunchesBloc(launchesRepository: LaunchesRepository(SpacexAPI()))
            ..add(LaunchesRequested()),
      child: MaterialApp(
        scaffoldMessengerKey: snackbarKey,
        debugShowCheckedModeBanner: false,
        home: const BottomNavBar(),
      ),
    );
  }
}
