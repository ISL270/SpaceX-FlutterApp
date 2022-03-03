import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../Data_layer/repositories/launches_repository.dart';
import '../../Data_layer/models/launch_model.dart';

part 'launches_event.dart';
part 'launches_state.dart';

class LaunchesBloc extends Bloc<LaunchesEvent, LaunchesState> {
  LaunchesRepository? launchesRepository;

  LaunchesBloc({required this.launchesRepository}) : super(LaunchesInitial()) {
    on<LaunchesRequested>((event, emit) async {
      emit(LaunchesLoading());
      LaunchModel? _nextLaunch;
      List<LaunchModel>? _launches = [];
      try {
        _nextLaunch = await launchesRepository!.nextLaunch();
        _launches = await launchesRepository!.pastLaunches();
        emit(LaunchesLoaded(launches: _launches, nextLaunch: _nextLaunch));
      } catch (e) {
        emit(LaunchesError(errorMessage: e.toString()));
      }
    });
  }
}
