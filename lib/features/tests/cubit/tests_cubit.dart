import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tests_state.dart';

class TestsCubit extends Cubit<TestsState> {
  TestsCubit() : super(TestsInitial());
}
