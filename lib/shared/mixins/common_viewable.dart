import 'package:eyr/localised/localiser.g.dart';
import 'package:eyr/states/locale/locale_cubit.dart';
import 'package:get_it/get_it.dart';

mixin CommonViewable {
  Localiser get localiser => GetIt.I<LocaleCubit>().state.localiser;
}
