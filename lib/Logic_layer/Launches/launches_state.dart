part of 'launches_bloc.dart';

abstract class LaunchesState extends Equatable {
  const LaunchesState();

  @override
  List<Object> get props => [];
}

class LaunchesInitial extends LaunchesState {}

class LaunchesLoading extends LaunchesState {}

class LaunchesLoaded extends LaunchesState {
  final LaunchModel? nextLaunch;
  final List<LaunchModel>? launches;
  const LaunchesLoaded({required this.launches, required this.nextLaunch});
}

class LaunchesError extends LaunchesState {
  final String? errorMessage;
  const LaunchesError({required this.errorMessage});
}
