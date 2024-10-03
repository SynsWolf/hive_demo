import 'package:flutter/material.dart';

class VueEnvoyerMessage extends StatelessWidget {

  const VueEnvoyerMessage({
    super.key,
    required this.envoyerMessage
  });

  final Function envoyerMessage;

  @override
  Widget build(BuildContext context) {
    final textControleur = TextEditingController();

    return Row(
      children: [
        Expanded(child: TextField(controller: textControleur)),
        IconButton(
          onPressed: () => envoyerMessage('Utilisateur 1', textControleur.text), 
          icon: const Icon(Icons.send))
      ],
    );
  }
}