import 'dart:convert';
import 'dart:io';

import 'package:googleapis/gmail/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

void main() async {

  final credentialsFile = File('credentials.json');
  final credentialsJson = jsonDecode(credentialsFile.readAsStringSync());

  final client = await clientViaUserConsent(
    ClientId(
      credentialsJson['installed']['client_id'],
      credentialsJson['installed']['client_secret'],
    ),
    [GmailApi.gmailSendScope],
    (url) {
      print('Por favor, abra o seguinte URL em seu navegador:');
      print(url);
    },
  );

  final gmailApi = GmailApi(client);

  final emailContent = '''From: "Seu Nome" <gonluk0607@gmail.com>
To: lucas.andrade14@aluno.ifce.edu.br
Subject: Teste de Email via API Gmail
Content-Type: text/plain; charset="UTF-8"

Olá, este é um teste de envio de e-mail via API do Gmail em Dart!
''';

  final base64Email = base64UrlEncode(utf8.encode(emailContent));

  final message = Message()
    ..raw = base64Email.replaceAll('+', '-').replaceAll('/', '_');

  try {
    final result = await gmailApi.users.messages.send(message, 'me');
    print('E-mail enviado com sucesso! ID: ${result.id}');
  } catch (e) {
    print('Erro ao enviar email: $e');
  }

  client.close();
}
