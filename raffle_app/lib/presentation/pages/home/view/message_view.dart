import 'package:flutter/material.dart';

import '../widgets/message_widget.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: size.height * 0.2),
      child: const Column(
        children: [
          MessageWidget(
              messageBody: 'Launched. Shop now and make it yours for just RAF500', sendingDate: '17 June, 02:30 PM'),
          MessageWidget(
              messageBody: 'Launched. Shop now and make it yours for just RAF500', sendingDate: '17 June, 02:30 PM'),
          MessageWidget(
              messageBody: 'Launched. Shop now and make it yours for just RAF500', sendingDate: '17 June, 02:30 PM'),
          MessageWidget(
              messageBody: 'Launched. Shop now and make it yours for just RAF500', sendingDate: '17 June, 02:30 PM'),
          MessageWidget(
              messageBody: 'Launched. Shop now and make it yours for just RAF500', sendingDate: '17 June, 02:30 PM'),
        ],
      ),
    );
  }
}
