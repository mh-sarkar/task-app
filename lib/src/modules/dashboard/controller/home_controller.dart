
import 'package:get/get.dart';
import 'package:mh_core/utils/enum_utils.dart';
import 'package:mh_core/utils/global.dart';
import 'package:mh_core/utils/string_utils.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  // final RxList<MenuModel> _menuList = <MenuModel>[].obs;
  //
  // List<MenuModel> get menuList => _menuList;

  @override
  Future<void> onInit() async {
    socketInit();
    // await getMenuBarList();
    super.onInit();
  }

  socketInit(){
    try{
      final channel = WebSocketChannel.connect(
        Uri.parse('ws://18.136.192.25:8000/connection////')
          ,
          protocols: ["echo-protocol"]);
    }catch(e){
      globalLogger.e(e);
    }
    // channel.stream.listen((message) {
    //   channel.sink.add('received!');
    //   channel.sink.close(status.goingAway);
    // });
  }
}