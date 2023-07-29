import 'package:foodorderproject/core/translation/language/ar_language.dart';
import 'package:foodorderproject/core/translation/language/en_language.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations{
  @override
  Map<String, Map<String, String>> get keys =>{
    "en_US": ENLanguage.map,
    "ar_SA": ARLanguage.map,
  };
}
tr(String key) => key.tr;