import 'package:multiple_result/multiple_result.dart';
import 'package:raffle_app/features/tickets/domain/ticket_domain.dart';

import '../../data/models/ticket_model.dart';
import '../../data/services/ticket_service.dart';

class TicketRepository implements TicketDomain {
  TicketRepository({required this.service});
  final TicketService service;
  
  @override
  Stream<Result<List<TicketModel>, Exception>> getUserTickets() {
    try {
      return service.getUserTicket().map(
        (tickets) => Success<List<TicketModel>, Exception>(tickets),
      ).handleError(
        (error) => Error<List<TicketModel>, Exception>(
          Exception(error.toString()),
        ),
      );
    } catch (e) {
      return Stream.value(
        Error<List<TicketModel>, Exception>(Exception(e.toString())),
      );
    }
  }
  
  @override
  Future<Result<bool, Exception>> buyTicket(TicketModel ticketModel) async {
     try {
      await service.buyTicket(ticketModel);
        return Success(true);
    } catch (e) {
      return Error(Exception(e.toString()));
    }
  }
}
