import 'package:flutter_bloc/flutter_bloc.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());
  static RadioCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  bool withChildren = false;

  void changeRadioIndex(int index){
    currentIndex = index;
    emit(ChangeRadioIndex());
  }

  void setChildrenOption(bool value) {
    withChildren = value;
    emit(ChangeRadioIndex());
  }
}
