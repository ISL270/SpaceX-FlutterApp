import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic_layer/Launches/launches_bloc.dart';
import '../../Data_layer/models/launch_model.dart';
import '../../Presentation_layer/launch.dart';

class NextLaunch extends StatefulWidget {
  const NextLaunch({Key? key}) : super(key: key);

  @override
  State<NextLaunch> createState() => _NextLaunchState();
}

class _NextLaunchState extends State<NextLaunch> {
  Future<void> refresh() async =>
      context.read<LaunchesBloc>()..add(LaunchesRequested());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xff585858),
          body: RefreshIndicator(
            onRefresh: refresh,
            child: BlocBuilder<LaunchesBloc, LaunchesState>(
              builder: (BuildContext context, LaunchesState state) {
                if (state is LaunchesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LaunchesLoaded) {
                  LaunchModel _nextLaunch = state.nextLaunch!;
                  return Launch(launch: _nextLaunch);
                } else if (state is LaunchesError) {
                  String error = state.errorMessage!;

                  return Center(child: Text(error));
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ));
                }
              },
            ),
          )),
    );
  }
}
