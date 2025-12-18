import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportController {
  static Future<bool> sendEmail({required String mailAddress, required String mailObjective}) async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

// ···
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: mailAddress,
      query: encodeQueryParameters(<String, String>{
        'subject': mailObjective,
      }),
    );

    return await launchUrl(
      emailLaunchUri,
    );
  }

  static Future<bool> makePhoneCall({required String phoneNumber}) async {
    if (Platform.isIOS) {
      final Uri phoneUrl = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );

      if (await canLaunchUrl(phoneUrl)) {
        return await launchUrl(phoneUrl);
      } else {
        return false;
      }
    } else {
      final String url = 'tel:$phoneNumber';
      if (await canLaunchUrl(Uri.parse(url))) {
        return await launchUrl(
          Uri.parse(url),
        );
      } else {
        return false;
      }
    }
    //String url = Platform.isIOS ? 'tel://$phoneNumber' : 'tel:$phoneNumber';

    // final String url = 'tel:$phoneNumber';
    // if (await canLaunchUrl(Uri.parse(url))) {
    //   return await launchUrl(
    //     Uri.parse(url),
    //   );
    // } else {
    //   return false;
    // }
  }

  static void launchInstagramOrAnyUrl({required String url}) {
    launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
      webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: true,
      ),
    );
  }

  static void openWhatsapp({required BuildContext context, required String text, required String number}) async {
    var whatsapp = number; //+92xx enter like this
    String whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=$text";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }
}
