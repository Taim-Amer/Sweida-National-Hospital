part of 'deaths_cubit.dart';

abstract class DeathsState {}

class DeathsInitial extends DeathsState {}

class AllDeathsLoadingState extends DeathsState {}
class AllDeathsSuccessState extends DeathsState {
  final AllDeathsModel allDeathsModel;
  AllDeathsSuccessState(this.allDeathsModel);
}
class AllDeathsFailureState extends DeathsState {
  final String error;
  AllDeathsFailureState(this.error);
}

class DeathByDateLoadingState extends DeathsState {}
class DeathByDateSuccessState extends DeathsState {
  final DeathByDateModel deathByDateModel;
  DeathByDateSuccessState(this.deathByDateModel);
}
class DeathByDateFailureState extends DeathsState {
  final String error;
  DeathByDateFailureState(this.error);
}

class StoreDeathLaodingState extends DeathsState {}
class StoreDeathSuccessState extends DeathsState {
  final StoreDeathModel storeDeathModel;
  StoreDeathSuccessState(this.storeDeathModel);
}
class StoreDeathFailureState extends DeathsState {
  final String error;
  StoreDeathFailureState(this.error);
}

class UpdateDeathLaodingState extends DeathsState {}
class UpdateDeathSuccessState extends DeathsState {
  final UpdateDeathModel updateDeathModel;
  UpdateDeathSuccessState(this.updateDeathModel);
}
class UpdateDeathFailureState extends DeathsState {
  final String error;
  UpdateDeathFailureState(this.error);
}

class DeleteDeathLaodingState extends DeathsState {}
class DeleteDeathSuccessState extends DeathsState {
  final DeleteDeathModel deleteDeathModel;
  DeleteDeathSuccessState(this.deleteDeathModel);
}
class DeleteDeathFailureState extends DeathsState {
  final String error;
  DeleteDeathFailureState(this.error);
}