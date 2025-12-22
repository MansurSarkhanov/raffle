

import 'package:raffle_app/features/tickets/data/models/ticket_model.dart';

abstract class TicketState {}


class TicketInitial extends TicketState{}
class TicketProgress extends TicketState{}
class TicketSuccess extends TicketState{
  final List<TicketModel> data;

  TicketSuccess({required this.data});

}
class TicketError extends TicketState{}
