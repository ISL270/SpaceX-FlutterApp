class SpacexAPI {
  static const String host = "api.spacexdata.com";

  static const String nextLaunchPath = "v4/launches/next";

  static const String pastLaunchesPath = "v4/launches/past";

  Uri nextLaunchUri() => Uri(scheme: 'https', host: host, path: nextLaunchPath);

  Uri pastLaunchesUri() =>
      Uri(scheme: 'https', host: host, path: pastLaunchesPath);
}
