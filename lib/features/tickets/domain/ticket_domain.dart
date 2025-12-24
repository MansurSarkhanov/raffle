import 'package:multiple_result/multiple_result.dart';

import '../data/models/ticket_model.dart';

abstract class TicketDomain {
  Future<Result<TicketDataModel?, Exception>> getUserTickets();
  Future<Result<bool, Exception>> buyTicket(TicketModel ticket);

}