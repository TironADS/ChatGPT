class ChatBotModel {
  ChatBotModel({
      this.chatbot,});

  ChatBotModel.fromJson(dynamic json) {
    chatbot = json['chatbot'] != null ? Chatbot.fromJson(json['chatbot']) : null;
  }
  Chatbot? chatbot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (chatbot != null) {
      map['chatbot'] = chatbot?.toJson();
    }
    return map;
  }

}

class Chatbot {
  Chatbot({
      this.message, 
      this.response,});

  Chatbot.fromJson(dynamic json) {
    message = json['message'];
    response = json['response'];
  }
  String? message;
  String? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['response'] = response;
    return map;
  }

}