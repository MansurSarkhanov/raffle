enum AppRoutes {
  splash(path: '/splash', name: 'splash'),
  auth(path: '/auth', name: 'auth'),
  home(path: '/home', name: 'home');

  final String path;
  final String name;
  const AppRoutes({required this.path, required this.name});
}
