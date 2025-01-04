
import 'package:alpha/presentation/view/chat/chat_view.dart';
import 'package:flutter/material.dart';

import '../../../../configurations/frontend_configs.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final bool isOnline;
  final bool? isSelected;
  final String? avatar;
  final int? unreadCount;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.isOnline,
    this.isSelected = false,
    this.avatar,
    this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isSelected == false ? const Color(0xffF5F7FA) :FrontendConfigs.kAppWhiteColor,
        boxShadow: [
          isSelected ==false ?BoxShadow():FrontendConfigs.kAppBoxShadow
        ]
      ),
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child:Image.asset(avatar!),
              ),
              if (isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                   name,
                  style:
                  FrontendConfigs.kAppTitleStyle
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          if(unreadCount!=null)  Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
