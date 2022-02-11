
import 'package:carros/bloc/simple_bloc.dart';
import 'package:carros/external/loripsum_api.dart';

class LoripsumBloc extends SimpleBloc<String> {
  static String? lorim;

  fetch() async {
    String s = lorim ?? await LoripsumApi.getLoripsum();
    lorim = s;
    add(s);
  }
}
