


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:raffle_app/features/tickets/data/models/ticket_model.dart';
import 'package:raffle_app/features/tickets/domain/ticket_domain.dart';
import 'package:raffle_app/features/tickets/presentation/notifier/ticket_state.dart';

class TicketProvider extends ChangeNotifier{
    TicketProvider({required this.repository});
  final TicketDomain repository;
     TicketState state = TicketInitial();
  StreamSubscription<Result<List<TicketModel>, Exception>>? _subscription;

  void watchUserTickets() {
    state = TicketProgress();
    notifyListeners();
    _subscription?.cancel();
    _subscription = repository.getUserTickets().listen((result) {
      result.when(
        (tickets) {
          state = TicketSuccess(data: tickets);
          notifyListeners();
        },
        (error) {
          state = TicketError();
          notifyListeners();
        },
      );
    });
  }
     Future<bool> buyTicket(TicketModel ticketModel) async {
      final ticket = await repository.buyTicket(ticketModel);
      if (ticket.isSuccess()) {
        return true;
      } else  {
         return false;
      }
  }
    @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}