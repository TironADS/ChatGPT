import 'dart:convert';

import 'package:chatbot/Repository/Api/api_client.dart';
import 'package:http/http.dart';

import '../../Model_Class/ChatBotModel.dart';

class ChatBotApi {

  ApiClient apiClient=ApiClient();

  Future<ChatBotModel>getChatbot() async{
    String path='https://ai-chatbot.p.rapidapi.com/chat/free?message=What\'s your name?&uid=user1';
    var body={};


    Response response=await apiClient.invokeAPI(path, 'GET', body);
    return ChatBotModel.fromJson(jsonDecode(response.body));
  }


}