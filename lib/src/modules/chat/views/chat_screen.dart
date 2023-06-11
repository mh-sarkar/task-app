import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mh_core/utils/constant.dart';
import 'package:task/src/utils/constants/color_constants.dart';
import 'package:task/src/utils/constants/route_name_constants.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Chat"),
      ),
      body: Column(
        children: [
          space3C,

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                space2C,
                MyContainer(
                  boxShadowColor: Colors.black.withOpacity(.25),
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return MessageListItem(
                        name: 'Cameron Williamson',
                        lastMsg: 'As I said in the previous email',
                        endedTime: 'Just now',
                        status: true,
                        index: index,
                        image: 'images/image/profileImage.png',
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}

class MessageListItem extends StatefulWidget {
  const MessageListItem({
    Key? key,
    required this.name,
    required this.lastMsg,
    required this.endedTime,
    required this.status,
    required this.index,
    required this.image,
  }) : super(key: key);

  final String name;
  final String image;
  final String lastMsg;
  final String endedTime;
  final bool status;
  final int index;

  @override
  State<MessageListItem> createState() => _MessageListItemState();
}

class _MessageListItemState extends State<MessageListItem> {
  bool showMessage = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8)
          .copyWith(top: widget.index == 0 ? 8 : null, bottom: 2),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRouteName.kPageMessage);
          showMessage = true;
          setState(() {

          });
        },
        child: Container(
          color: showMessage ? Colors.white : AppColors.kPrimaryColor.withOpacity(.15),
          height: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Stack(
                  children: [
                    MyContainer(
                      borderRadius: BorderRadius.circular(100),
                      height: 48,
                      width: 48,
                      boxShadowColor: Colors.black.withOpacity(.25),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Icon(Icons.person, color: AppColors.kPrimaryColor,size: 40,),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 7,
                      right: 0,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff0CBC1E),
                        ),
                      ),
                    )
                  ],
                ),
                space2R,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(widget.name, ),
                          const Spacer(),
                          Text(widget.endedTime,                         style:const TextStyle(fontSize: 10),
                          ),
                            ],
                      ),
                      space1C,
                      Text(
                        widget.lastMsg,
                        style:const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class MyContainer extends StatelessWidget {
  const MyContainer({
    Key? key,
    this.color,
    this.blurRadius,
    this.boxShadowColor,
    this.height,
    this.width,
    this.circularBorder,
    this.x,
    this.y,
    this.borderRadius,
    this.child,
  }) : super(key: key);

  final Color? color;
  final Color? boxShadowColor;
  final double? blurRadius;
  final double? height;
  final double? width;
  final double? circularBorder;
  final double? x;
  final double? y;
  final BorderRadius? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius:
          borderRadius ?? BorderRadius.circular(circularBorder ?? 5),
          boxShadow: [
            BoxShadow(
              blurRadius: blurRadius ?? 4,
              color: boxShadowColor ?? Colors.black.withOpacity(.12),
              offset: Offset(x ?? 0.0, y ?? 0.0),
            )
          ]),
      child: child,
    );
  }
}
