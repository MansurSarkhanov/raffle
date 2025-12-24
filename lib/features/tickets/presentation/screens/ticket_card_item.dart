import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/theme_ext.dart';
import '../../../../presentation/components/gradient_text.dart';
import '../../../../shared/painter/liner_dash_painter.dart';
import '../../data/models/ticket_model.dart';

class TicketCardItem extends StatelessWidget {
  final TicketModel ticket;
  final bool shadow;
  final bool showDashLine;
  final String cardCount;


  const TicketCardItem({
    required this.ticket,
    this.shadow = false,
    super.key, required this.showDashLine, required this.cardCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/ticket.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: shadow
            ? [
                BoxShadow(
                  blurRadius: 50,
                  spreadRadius: 10,
                  offset: const Offset(0, 30),
                  color: Colors.black.withValues(alpha: 0.15),
                )
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context: context,cardCount:   cardCount,showCount:showDashLine ),
          SizedBox(height: 16.h),
          _buildDetails(context),
          const SizedBox(height: 4),
          showDashLine ? _buildDashedLine() : SizedBox.shrink(),
          const SizedBox(height: 6),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader({required BuildContext context,required String cardCount,required bool showCount}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 24, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/im_raffle_logo.png',
                  height: 27, width: 27),
              const SizedBox(width: 6),
              GradientText(
                'raffle',
                style: context.typography.body2Bold.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                gradient: const LinearGradient(
                  colors: [Color(0xFFCE2B37), Color(0xFFFFCE0B)],
                ),
              ),
            ],
          ),
        showCount?  Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFCE2B37), Color(0xFFF09A1A)],
              ),
            ),
            child:  Padding(
              padding: EdgeInsets.all(10),
              child: Text(
               cardCount,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
            ),
          ):Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            color: Colors.white
            ),
            child:  Padding(
              padding: EdgeInsets.all(10),
              child: Text(
               cardCount,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Prize: AZN${ticket.price} Cash",
            style: context.typography.body2Regular.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Product: ${ticket.product}",
            style: context.typography.body2Regular.copyWith(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "Issued on:",
            style: context.typography.body2Regular.copyWith(fontSize: 10),
          ),
          Text(
            ticket.issuedOn,
            style: context.typography.body2Regular.copyWith(fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildDashedLine() {
    return SizedBox(
      height: 4,
      child: CustomPaint(
        painter: DashedLinePainter(),
        size: const Size(double.infinity, 2),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(Icons.access_time_filled_rounded,
                  size: 20, color: Color(0xFF7D7D7D)),
              const SizedBox(width: 6),
              Text(
                "Sold out: ${ticket.soldOut}",
                style: context.typography.body2Regular.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Ticket No.",
                style: context.typography.body2Regular.copyWith(
                  fontSize: 10,
                ),
              ),
              Text(
                ticket.ticketNo,
                style: context.typography.body2Bold.copyWith(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
