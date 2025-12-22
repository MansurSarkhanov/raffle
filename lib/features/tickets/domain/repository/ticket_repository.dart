import 'package:multiple_result/multiple_result.dart';
import 'package:raffle_app/features/tickets/domain/ticket_domain.dart';

import '../../data/models/ticket_model.dart';
import '../../data/services/ticket_service.dart';

class TicketRepository implements TicketDomain {
  TicketRepository({required this.service});
  final TicketService service;
  @override
  Future<Result<TicketDataModel?, Exception>> getUserTickets() async {
    try {
      final ticket = await service.getUserTicket();
      if (ticket != null) {
        final ticketModel = await ticket.get();
        return Success(ticketModel.data());
      }
      return Error(Exception());
    } catch (e) {
      return Error(Exception(e.toString()));
    }
  }
}
