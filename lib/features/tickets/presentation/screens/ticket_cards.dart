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
  static const double collapsedOverlap = 10;
  static const double expandedOverlap = 48;

  double currentOverlap = collapsedOverlap;
  List<TicketModel> _tickets = [];
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<TicketProvider>(
      builder: (context, provider, _) {
        final state = provider.state;

        if (state is TicketProgress) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TicketSuccess) {
          if (!_initialized) {
            _tickets = List<TicketModel>.from(state.data);
            _initialized = true;
          }

          return _buildStack();
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildStack() {
    return Stack(
      alignment: Alignment.topCenter,
      children: List.generate(
        _tickets.length,
            (index) {
          final top =
              (_tickets.length - index - 1) * currentOverlap;

          final isTopCard = index == _tickets.length - 1;
          return AnimatedPositioned(
            key: ObjectKey(_tickets[index]),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOutCubic,
            top: top,
            left: 0,
            right: 0,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (isTopCard) {
                      currentOverlap =
                      currentOverlap == collapsedOverlap
                          ? expandedOverlap
                          : collapsedOverlap;
                    } else {
                      final tapped = _tickets.removeAt(index);
                      _tickets.add(tapped);
                    }
                  });
                },

                child: TicketCardItem(
                  ticket: _tickets[index],
                  shadow: true,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
