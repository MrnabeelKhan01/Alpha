import 'package:alpha/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';
import '../../../../../../models/message.dart';

class MessageRowWidget extends StatelessWidget {
  final Message message;
  final bool current;

   const MessageRowWidget({
    super.key,
    required this.message,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      current ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (current) _buildProfileWithTime(context),
        Column(
          crossAxisAlignment:
          current ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  current ? "Jane Wilson" : "Jacob Hawkins",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  current ? "10:43" : "10:47",
                  style: const TextStyle(
                    color: Color(0xff637085),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Align(
              alignment: current ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 40,
                  maxHeight: 250,
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                  minWidth: MediaQuery.of(context).size.width * 0.1,
                ),
                decoration: BoxDecoration(
                  color: current ? const Color(0xffF5F7FA) : Colors.blue,
                  borderRadius: current
                      ? const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                      : const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  child: _buildMessageContent(),
                ),
              ),
            ),
          ],
        ),
        if (!current) _buildProfileWithTime(context),
      ],
    );
  }
  Widget _buildMessageContent() {
    switch (message.type) {
      case MessageType.image:
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            message.fileUrl!,
            fit: BoxFit.cover,
          ),
        );
      case MessageType.file:
        return GestureDetector(
          onTap: () {

          },
          child: Row(
            children: [
              const Icon(Icons.insert_drive_file, color: Colors.blue),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  message.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        );
      default:
        return Text(
          message.description,
          style:  TextStyle(color:current?FrontendConfigs.kAppTextColor:FrontendConfigs.kAppWhiteColor,fontSize:15,fontWeight:FontWeight.w400),
        );
    }
  }

  Widget _buildProfileWithTime(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          current
              ? "assets/images/avatar_three.png"
              : "assets/images/avatar_two.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}