enum AppRoute {
  newLoan('/newLoan', true),
  loans('/loans', true),
  home('/home', true),
  transfers('/transfers', true),
  currency('/currency', true),
  success('success'),
  payment('payment');

  const AppRoute(this.path, [this.main = false]);

  final String path;
  final bool main;
}
