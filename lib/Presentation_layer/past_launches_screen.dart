import 'package:bloc_news/Presentation_layer/launch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic_layer/Launches/launches_bloc.dart';
import '../../Data_layer/models/launch_model.dart';

class PastLaunches extends StatefulWidget {
  const PastLaunches({Key? key}) : super(key: key);

  @override
  _PastLaunchesState createState() => _PastLaunchesState();
}

class _PastLaunchesState extends State<PastLaunches> {
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
                  List<LaunchModel> _launches = [];
                  _launches = state.launches!;
                  return ListView.separated(
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 1.5,
                          indent: 15,
                          endIndent: 15,
                        );
                      },
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      itemCount: _launches.length,
                      itemBuilder: (context, index) => GestureDetector(
                            child: ListTile(
                              title: Text(
                                _launches[index].name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              trailing: const Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () => Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    Launch(launch: _launches[index]),
                              ),
                            ),
                          ));
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
