import 'package:alpha/configurations/frontend_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget(
      {super.key,
      required this.name,
      required this.logo,
      required this.socialMedia,
      required this.followers});

  final String name;
  final String logo;
  final String socialMedia;
  final String followers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:15.0),
      child: Container(
        width:MediaQuery.sizeOf(context).width/1.2,
        decoration: BoxDecoration(
            color: FrontendConfigs.kAppWhiteColor,
            boxShadow: [FrontendConfigs.kAppBoxShadow],
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.only(left:12.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Container(
                    height:68,
                    clipBehavior:Clip.hardEdge,
                    decoration:BoxDecoration(
                      shape:BoxShape.circle,
                    ),
                      child: Image.asset(logo)),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:6,),
                      Text(
                        name,
                        style: TextStyle(fontSize:15,fontWeight:FontWeight.w600,color:FrontendConfigs.kAppTextColor),
                      ),
                      Text(
                        socialMedia,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff637085)),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          followers,
                          style: FrontendConfigs.kAppSubHeadingStyle,
                        ),
                        SizedBox(width:18,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: FrontendConfigs.kAppGreenColor.withOpacity(0.10)),
                          child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal:8.0,vertical:5),
                            child: Row(children: [
                              SvgPicture.asset("assets/icons/increase_icon.svg"),
                              SizedBox(width:6,),
                              Text("1.43%",style:TextStyle(fontSize:15,fontWeight:FontWeight.w600,color:FrontendConfigs.kAppGreenColor),)
                            ],),
                          ),
                        ),

                      ],
                    ),
                    Text(
                      "Followers",
                      style: TextStyle(
                          color: Color(0xff637085),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
