import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/ticket_model.dart';
import '../notifier/ticket_provider.dart';
import '../notifier/ticket_state.dart';
import 'ticket_card_item.dart';
class TicketCards extends StatefulWidget {
  const TicketCards({super.key});

  @override
  State<TicketCards> createState() => _TicketCardsState();
}

class _TicketCardsState extends State<TicketCards> {
  static const double collapsedOverlap = 200;
  static const double expandedOverlap = 48;
  static const double cardHeight = 260;

  double currentOverlap = expandedOverlap;

  @override
  Widget build(BuildContext context) {
    return Consumer<TicketProvider>(
      builder: (context, provider, _) {
        final state = provider.state;

        if (state is TicketProgress) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TicketSuccess) {
          return RefreshIndicator(
            onRefresh: () async {
                await context.read<TicketProvider>().getUserTickets();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: _buildScrollableStack(state.data),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildScrollableStack(List<TicketModel> tickets) {
    final totalHeight =
        (tickets.length - 1) * currentOverlap + cardHeight + 80;

    return SizedBox(
      height: totalHeight < MediaQuery.of(context).size.height
          ? MediaQuery.of(context).size.height
          : totalHeight,
      child: Stack(
        alignment: Alignment.topCenter,
        children: List.generate(tickets.length, (index) {
          final top =
              (tickets.length - index - 1) * currentOverlap;

          final isTopCard = index == tickets.length - 1;

          return AnimatedPositioned(
            key: ObjectKey(tickets[index].id),
            duration: const Duration(milliseconds: 800),
            curve: Curves.decelerate,
            top: top,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 16),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (isTopCard) {
                      currentOverlap =
                          currentOverlap == collapsedOverlap
                              ? expandedOverlap
                              : collapsedOverlap;
                    } else {
                      final tapped = tickets.removeAt(index);
                      tickets.add(tapped);
                    }
                  });
                },
                child: TicketCardItem(
                  showDashLine: tickets.length - 1 == index,
                  ticket: tickets[index],
                  shadow: index != 0,
                  cardCount: tickets.length.toString(),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
