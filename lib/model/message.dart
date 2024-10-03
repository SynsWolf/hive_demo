import 'package:hive/hive.dart';
part 'message.g.dart';

// Rouler ligne de commande:
// flutter packages pub run build_runner build

@HiveType(typeId: 1)
class Message {
  const Message({required this.alias, required this.message});

  @HiveField(0)
  final String alias;

  @HiveField(1)
  final String message;

  @override
  String toString() {
    return 'Alias: $alias, Message: $message';
  }
}