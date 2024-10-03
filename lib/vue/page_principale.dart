import '../model/message.dart';
import 'package:hive/hive.dart';
import 'vue_liste_message.dart';
import 'vue_envoyer_message.dart';
import 'package:flutter/material.dart';

class PagePrincipale extends StatefulWidget {
  const PagePrincipale({super.key});

  @override
  State<PagePrincipale> createState() {
    return _PagePrincipaleState();
  }
}

class _PagePrincipaleState extends State<PagePrincipale> {
  List<Message> _messages = [];
  late bool _isLoading;
  Box? _boxMessages;

  @override
  void initState() {
    super.initState();

    if (_boxMessages == null) {
      _isLoading = true;
      _initDatabase();
    } else {
      _isLoading = false;
    }
  }

  void _initDatabase() async {
    Hive.registerAdapter(MessageAdapter());

    var box = await Hive.openBox('messages');

    List<Message> messages = box
        .get('messages', defaultValue: List<Message>.empty(growable: true))!
        .cast<Message>();

    setState(() {
      _isLoading = false;
      _boxMessages = box;
      _messages = messages;
    });
  }

  void _sauvegarderMessage(String alias, String message) {
    setState(() {
      _messages.add(Message(alias: alias, message: message));
      _boxMessages?.put('messages', _messages);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _isLoading
        ? const CircularProgressIndicator()
        : Column(children: [
            VueListeMessage(messages: _messages),
            VueEnvoyerMessage(envoyerMessage: _sauvegarderMessage)
          ]);
  }
}
