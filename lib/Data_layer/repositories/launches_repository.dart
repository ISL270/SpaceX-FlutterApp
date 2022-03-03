import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/launch_model.dart';
import '../../Services/globals.dart';
import '../../Services/spacex_api.dart';

class LaunchesRepository {
  final SpacexAPI spacexAPI;
  LaunchesRepository(this.spacexAPI);

  Future<LaunchModel> nextLaunch() async {
    final uri = spacexAPI.nextLaunchUri();
    LaunchModel? _nextLaunch;
    try {
      final response = await http.get(uri);
      final data = json.decode(response.body);

      if (data.isNotEmpty) {
        _nextLaunch = LaunchModel.fromJson(data);
      } else {
        snackbarKey.currentState?.showSnackBar(
            const SnackBar(content: Text("There is no data to display.")));
      }
    } on SocketException {
      snackbarKey.currentState?.showSnackBar(
          const SnackBar(content: Text("No Internet connection!")));
    } on HttpException {
      snackbarKey.currentState?.showSnackBar(
          const SnackBar(content: Text("Couldn't find the requested data!")));
    } on FormatException {
      snackbarKey.currentState
          ?.showSnackBar(const SnackBar(content: Text("Bad response format!")));
    }
    return _nextLaunch!;
  }

  Future<List<LaunchModel>> pastLaunches() async {
    final uri = spacexAPI.pastLaunchesUri();
    List<LaunchModel> _launches = [];
    try {
      final response = await http.get(uri);
      final data = json.decode(response.body);

      if (data.isNotEmpty) {
        for (var item in data) {
          LaunchModel _launch = LaunchModel.fromJson(item);
          _launches.add(_launch);
        }
      } else {
        snackbarKey.currentState?.showSnackBar(
            const SnackBar(content: Text("There is no data to display.")));
      }
    } on SocketException {
      snackbarKey.currentState?.showSnackBar(
          const SnackBar(content: Text("No Internet connection!")));
    } on HttpException {
      snackbarKey.currentState?.showSnackBar(
          const SnackBar(content: Text("Couldn't find the requested data!")));
    } on FormatException {
      snackbarKey.currentState
          ?.showSnackBar(const SnackBar(content: Text("Bad response format!")));
    }
    return _launches;
  }
}
