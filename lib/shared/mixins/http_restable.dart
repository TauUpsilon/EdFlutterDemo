import 'package:eyr/api/eyr_spring_boot/api000/api000_service.dart';
import 'package:get_it/get_it.dart';

mixin HttpRestable {
  Api000Service get api000Service => GetIt.I<Api000Service>();
}
