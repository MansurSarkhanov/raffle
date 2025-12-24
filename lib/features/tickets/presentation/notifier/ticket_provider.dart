


import 'package:flutter/material.dart';
import 'package:raffle_app/features/tickets/data/models/ticket_model.dart';
import 'package:raffle_app/features/tickets/domain/ticket_domain.dart';
import 'package:raffle_app/features/tickets/presentation/notifier/ticket_state.dart';

class TicketProvider extends ChangeNotifier{
    TicketProvider({required this.repository});
  final TicketDomain repository;
    TicketState state = TicketInitial();

    Future<void> getUserTickets() async {
    try {
      state = TicketInitial();
      final ticketModel = await repository.getUserTickets();
      if (ticketModel.isSuccess()) {
      final   tickets = ticketModel.tryGetSuccess();
        state = TicketSuccess(data:tickets!.data );
      } else if (ticketModel.isError()) {
        state = TicketError();
      }
      notifyListeners();
    } catch (e) {
      state = TicketError();
      notifyListeners();
    }
  }
     Future<bool> buyTicket(TicketModel ticketModel) async {
      final ticket = await repository.buyTicket(ticketModel);
      if (ticket.isSuccess()) {
        return true;
      } else  {
         return false;
      }
  }
}