enum AppRoute {
  newLoan('/newLoan'),
  loans('/loans'),
  home('/home'),
  transfers('/transfers'),
  currency('/currency');

  const AppRoute(this.path);

  final String path;
}
