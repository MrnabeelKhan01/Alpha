import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../configurations/frontend_configs.dart';

class BottomBarWidget extends StatelessWidget {
  final TextEditingController controller;

  const BottomBarWidget({super.key, required this.controller});

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      print('Picked file: ${file.path}');
    } else {
      print('No file selected');
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File file = File(image.path);
      print('Picked image: ${file.path}');
    } else {
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 2.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 6.0,
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom:10,top:6,right:4,left:4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFEBEEF2), width: 1)),
                  child: Row(
                    children: [
                      CircleAvatar(
                          radius: 20,
                          child: Image.asset("assets/images/profile.png")),
                      SizedBox(width:8,),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            hintStyle:FrontendConfigs.kAppTitleStyle,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F7FA),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SvgPicture.asset('assets/icons/send_icon.svg'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,bottom:10),
            child: Row(children: [
              InkWell(
                onTap:(){},
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset('assets/icons/smile_icon.svg'),
                ),
              ),
              SizedBox(width:6,),
              InkWell(
                onTap:(){
                  _pickFile();

                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset('assets/icons/attachment_icon.svg'),
                ),
              ),
              SizedBox(width:6,),
              InkWell(
                onTap:(){
                  _pickImage();
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset('assets/icons/image_icon.svg'),
                ),
              ),
            ],),
          )
        ],
      ),
    );
  }
}
