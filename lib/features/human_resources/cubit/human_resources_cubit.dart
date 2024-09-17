import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/network/local/cache_helper.dart';

part 'human_resources_state.dart';

class HumanResourcesCubit extends Cubit<HumanResourcesState> {
  HumanResourcesCubit() : super(HumanResourcesInitial());

  static HumanResourcesCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");


}
