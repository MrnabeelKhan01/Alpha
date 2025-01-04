import 'package:alpha/configurations/frontend_configs.dart';
import 'package:alpha/presentation/view/chat/chat_view.dart';
import 'package:alpha/presentation/view/chat_list/widgets/chat_tile.dart';
import 'package:alpha/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  int selectedPinnedIndex = 1;
  int selectedAllMessageIndex = -1;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: FrontendConfigs.kAppTitleStyle,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left:16.0,top:12,bottom:12,right:8),
                    child: SvgPicture.asset("assets/icons/search_icon.svg"),
                  ),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              Divider(
                color: Color(0xffE3E5E8),
              ),
              _buildSectionTitle("Pinned".toUpperCase()),
              ListView.builder(
                itemCount: Utils.messagePinnedList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPinnedIndex = i;
                      });
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatView(
                                    profileImage: Utils.messagePinnedList[i].avatar,
                                    name: Utils.messagePinnedList[i].name)));
                      },
                      child: ChatTile(
                        name: Utils.messagePinnedList[i].name,
                        message: Utils.messagePinnedList[i].message,
                        isOnline: i % 2 == 0,
                        avatar: Utils.messagePinnedList[i].avatar,
                        isSelected: selectedPinnedIndex == i,
                        unreadCount: i == 1 || i == 3 ? 5 : null,
                      ),
                    ),
                  );
                },
              ),
              _buildSectionTitle("All Messages".toUpperCase()),
              ListView.builder(
                itemCount: Utils.allMessageList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAllMessageIndex = i;
                      });
                    },
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatView(
                                    profileImage: Utils.allMessageList[i].avatar,
                                    name: Utils.allMessageList[i].name)));
                      },
                      child: ChatTile(
                        name: Utils.allMessageList[i].name,
                        message: Utils.allMessageList[i].message,
                        isOnline: i % 3 == 0,
                        avatar: Utils.allMessageList[i].avatar,
                        isSelected: selectedAllMessageIndex == i,
                        unreadCount: i == 1 || i == 3 ? 2 : null,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)
            .copyWith(color: Color(0xff2D3F59)),
      ),
    );
  }
}
