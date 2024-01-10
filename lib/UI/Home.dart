import 'package:chatbot/Repository/Model_Class/ChatBotModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

import '../BloC/chatbot_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

TextEditingController controller = TextEditingController();

List<String> message = [];

late ChatBotModel data;

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Center(
          child: Text(
            'Chat GPT - 4',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatbotBloc, ChatbotState>(
                builder: (context, state) {
                  if (state is ChatBotBlocLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is ChatBotBlocError) {
                    return Center(
                      child: Text('Try again !!'),
                    );
                  }
                  if (state is ChatBotBlocLoaded) {
                    data = BlocProvider
                        .of<ChatbotBloc>(context)
                        .chatBotModel;

                    return ListView.builder(
                      itemCount: message.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ChatBubble(
                              clipper: ChatBubbleClipper5(
                                  type: BubbleType.sendBubble),
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(bottom: 20),
                              backGroundColor: Colors.blue,
                              child: Text(message[index],
                                style: TextStyle(color: Colors.white),),
                            ),
                            ChatBubble(
                              clipper: ChatBubbleClipper5(
                                  type: BubbleType.receiverBubble),
                              backGroundColor: Color(0xffdedede),
                              margin: EdgeInsets.only(bottom: 20),
                              child: Text(
                                data.chatbot!.response.toString(),
                                style: TextStyle(color: Colors.black),),
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    return Expanded(
                      child: Container(
                        child: Center(
                            child: Icon(
                              Icons.bubble_chart_rounded,
                              color: Colors.white12,
                              size: 200,
                            )),
                      ),
                    );
                  }
                },
              ),
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 265,
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: 260,
                        child: TextFormField(
                          controller: controller,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Message',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      message.add(controller.text);
                      print(controller.text);
                      BlocProvider.of<ChatbotBloc>(context).add(FetchChatbot(message: controller.text));
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(Icons.arrow_upward_rounded),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
