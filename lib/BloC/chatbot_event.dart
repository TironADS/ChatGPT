part of 'chatbot_bloc.dart';

@immutable
abstract class ChatbotEvent {}

class FetchChatbot extends ChatbotEvent {
  final String message;
  FetchChatbot({required this .message});
}

