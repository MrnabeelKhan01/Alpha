import 'package:alpha/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';

import '../../../../../models/message.dart';
import 'widget/build_bottom_bar.dart';
import 'widget/chat_widget.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({Key? key}) : super(key: key);

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}
TextEditingController _controller = TextEditingController();
final List<Message> messages = [
  Message(0,
      "Hi Jacob and Brandon, any progress on the project? 😀",'Jane Wilson', time: '10:43'),
  Message(1, "Hi Jane!","Jacob Hawkins", time: '10:47'),
  Message(2,
      "Yes. I just finished developing the Chat template.😀","Jacob Hawkins", time: ''),
  Message(3, "I suppose I am.","Jacob Hawkins", time: ''),

  Message(4, "It looks amazing. The customer will be very satisfied.","Jane Wilson",time: '10:47'),
  Message(5, "@Brandon, can you send me the Style Guide.","Jane Wilson",time: '10:47'),
  Message(6, "Hi Jane! I’ve completed 16 of 20 problems so far","",time: '10:47'),
];
class _ChatViewBodyState extends State<ChatViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:16.0,right:14,left:14,bottom:8),
      child: Container(
        decoration:BoxDecoration(
          color:FrontendConfigs.kAppWhiteColor,
          borderRadius:BorderRadius.circular(16),
          boxShadow:[
            FrontendConfigs.kAppBoxShadow
          ]
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height:40,),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10.0);
                },
                reverse: false,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  Message m = messages[index];
                  if (m.user == 0 || m.user == 4) {
                    return MessageRowWidget(
                      current: true,
                      message: m,
                    );
                  }
                  return MessageRowWidget(
                    current: false,
                    message: m,
                  );
                },
              ),
            ),
            BottomBarWidget(controller: _controller)
          ],
        ),
      ),
    );
  }
}