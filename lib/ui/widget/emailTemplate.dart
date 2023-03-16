import 'package:flutter_email_sender/flutter_email_sender.dart';

Future<String> send({
  required String reportSubject, 
  required String reportBody
}) async {
  
  final Email email = Email(
    subject: reportSubject,
    body: reportBody,
    recipients: ['zahir@mitsb.my'],
    isHTML: false,
  );

  String platformResponse;

  try {
    await FlutterEmailSender.send(email);
    platformResponse = 'success';
  } catch (error) {
    print(error);
    platformResponse = error.toString();
  }

  return platformResponse;
}