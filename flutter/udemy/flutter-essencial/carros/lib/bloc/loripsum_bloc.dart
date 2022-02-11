
import 'package:carros/bloc/simple_bloc.dart';
import 'package:carros/external/loripsum_api.dart';

class LoripsumBloc extends SimpleBloc<String> {
  fetch() async {
    String s = await LoripsumApi.getLoripsum();
    add(s);
  }
}
