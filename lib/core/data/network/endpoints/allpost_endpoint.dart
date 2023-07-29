
import 'package:foodorderproject/core/data/network/network_config.dart';


class AllPostEndpoints{
  static String getAllPost=NetworkConfig.getFullApiRoute('posts/');
  static String getAllphoto=NetworkConfig.getFullApiRoute('albums/');
  static String delAllphoto=NetworkConfig.getFullApiRoute('posts/');
}