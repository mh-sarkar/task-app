import 'package:flutter/material.dart';
import 'package:mh_core/utils/constant.dart';
import 'package:mh_core/widgets/divider/custom_divider.dart';
import 'package:mh_core/widgets/textfield/custom_textfield.dart';
import 'package:task/src/modules/chat/views/chat_screen.dart';
import 'package:task/src/utils/constants/color_constants.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  static const routeName = '/message-screen';

  @override
  State<MessageScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<MessageScreen> {
  final _messageController = TextEditingController();
  final _messageFocusNode = FocusNode();

  @override
  void dispose() {
    _messageController.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 8,
        toolbarHeight: 68,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: MyContainer(
                  color: Colors.transparent,
                    boxShadowColor: Colors.transparent,
                    height: 36,
                    blurRadius: 8,
                    child: Icon(Icons.arrow_back_outlined)),
              ),
            ],
          ),
        ),
        title: Row(
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
                      child: Icon(Icons.person, color: Colors.grey,size: 40,),
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
                  const Text(
                    'Sachine Tendulkar',
                  ),
                  space1C,
                  const Text('Active', style: TextStyle(fontSize: 12)),
                ],
              ),
            )
          ],
        ),
        actions: [
          Icon(Icons.more_vert),
          space4R,
        ],
      ),
      body: Column(
        children: [
          const MyDivider(),
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  space1C,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 34,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor.withOpacity(.20),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text('Today', style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                  space3C,
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return MessageItem(
                        index: index,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _messageController,
                    focusNode: _messageFocusNode,
                    marginHorizontal: 0,
                    marginVertical: 0,
                    height: 48,
                    focusColor: Colors.black.withOpacity(.8),
                    enableBorderColor: Colors.black.withOpacity(.8),
                    borderRadius: 2,
                    hintText: "Type Your Message Here",
                    prefixWidget: Icon(Icons.message, color: AppColors.kPrimaryColor,size: 30,),
                  ),
                ),
                space2R,
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Icon(Icons.telegram_outlined, color: Colors.white,size: 40,),
                )
              ],
            ),
          ),
          space2C,
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
          Navigator.of(context).pushNamed(MessageScreen.routeName);
          showMessage = true;
          setState(() {});
        },
        child: Container(
          color: showMessage
              ? Colors.white
              : AppColors.kPrimaryColor.withOpacity(.15),
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
                          child: Image.asset(widget.image, fit: BoxFit.cover),
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
                          Text(
                            widget.name,
                          ),
                          const Spacer(),
                          Text(widget.endedTime,
                              style: const TextStyle(fontSize: 10)),
                        ],
                      ),
                      space1C,
                      Text(
                        widget.lastMsg,
                        style: const TextStyle(fontSize: 12),
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

class MessageItem extends StatelessWidget {
  const MessageItem({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 6),
          child: Row(
            mainAxisAlignment: index % 2 == 0
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              if (index % 2 != 0)
                const Text('12:00 PM', style: TextStyle(fontSize: 10)),
              if (index % 2 == 0)
                MyContainer(
                  borderRadius: BorderRadius.circular(100),
                  height: 36,
                  width: 36,
                  boxShadowColor: Colors.black.withOpacity(.25),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
              space2R,
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width * .60,
                  minWidth: 100,
                ),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: index % 2 == 0
                          ? AppColors.kPrimaryColor.withOpacity(.2)
                          : AppColors.kPrimaryColor),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      'Great sir Great si rGreat sir Great sirGreat sirGreat sirGreat sir Great sirGreat sirGreat sirGreat sir Great sir Great si rGreat sir Great sirGreat sirGreat sirGreat sir Great sirGreat sirGreat sirGreat sir Great sir Great si rGreat sir Great sirGreat sirGreat sirGreat sir Great sirGreat sirGreat sirGreat sir Great sir Great si rGreat sir Great sirGreat sirGreat sirGreat sir Great sirGreat sirGreat sirGreat sir',
                      style: index % 2 == 0
                          ? const TextStyle(fontSize: 12)
                          : const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
// maxLines: 10,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
              space2R,
              if (index % 2 == 0)
                const Text('12:00 PM', style: TextStyle(fontSize: 10)),
            ],
          ),
        )
      ],
    );
  }
}
