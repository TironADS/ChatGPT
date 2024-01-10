part of 'chatbot_bloc.dart';

@immutable
abstract class ChatbotState {}

class ChatbotInitial extends ChatbotState {}

class ChatBotBlocLoading extends ChatbotState {}

class ChatBotBlocLoaded extends ChatbotState {}

class ChatBotBlocError extends ChatbotState {}
