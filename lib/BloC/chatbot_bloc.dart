import 'package:bloc/bloc.dart';
import 'package:chatbot/Repository/Api/Api/ChatBot_Api.dart';
import 'package:meta/meta.dart';

import '../Repository/Model_Class/ChatBotModel.dart';

part 'chatbot_event.dart';

part 'chatbot_state.dart';

class ChatbotBloc extends Bloc<ChatbotEvent, ChatbotState> {
  ChatBotApi chatBotApi=ChatBotApi();
  late ChatBotModel chatBotModel;

  ChatbotBloc() : super(ChatbotInitial()) {
    on<FetchChatbot>((event, emit) async{
      emit(ChatBotBlocLoading());
      try{
        chatBotModel = await chatBotApi.getChatbot();
        emit(ChatBotBlocLoaded());
      }catch(e){
        print(e);
        emit(ChatBotBlocError());
      }
    });
  }
}
