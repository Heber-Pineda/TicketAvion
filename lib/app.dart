final _router = GoRouter(
  routes: [

    GoRoute(path: '/', builder: (context, state) => TicketListScreen()),
    GoRoute(path: '/add', builder: (context, state) => AddTicketScreen()),
    path: '/add_ticket',
  builder: (context, state) => AddTicketScreen(),
    GoRoute(path: '/edit/:id', builder: (context, state) {
      final id = state.params['id'];
      return EditTicketScreen(ticketId: id);
    }),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
