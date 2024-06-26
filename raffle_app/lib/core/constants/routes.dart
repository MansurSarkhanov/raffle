enum AppRoutes {
  splash(path: '/splash', name: 'splash'),
  auth(path: '/auth', name: 'auth'),
  profile(path: '/profile', name: 'profile'),
  foodDetail(path: '/foodDetail', name: 'foodDetail'),


  home(path: '/home', name: 'home');

  final String path;
  final String name;
  const AppRoutes({required this.path, required this.name});
}
