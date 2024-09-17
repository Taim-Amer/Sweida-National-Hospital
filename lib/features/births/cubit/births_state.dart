part of 'births_cubit.dart';

abstract class BirthsState {}

class BirthsInitial extends BirthsState {}

class AllBirthsLoadingState extends BirthsState {}
class AllBirthsSuccessState extends BirthsState {
  final AllBirthsModel allBirthsModel;
  AllBirthsSuccessState(this.allBirthsModel);
}
class AllBirthsFailureState extends BirthsState {
  final String error;
  AllBirthsFailureState(this.error);
}

class BirthByDateLoadingState extends BirthsState {}
class BirthByDateSuccessState extends BirthsState {
  final BirthByDateModel birthByDateModel;
  BirthByDateSuccessState(this.birthByDateModel);
}
class BirthByDateFailureState extends BirthsState {
  final String error;
  BirthByDateFailureState(this.error);
}

class StoreBirthLaodingState extends BirthsState {}
class StoreBirthSuccessState extends BirthsState {
  final StoreBirthModel storeBirthModel;
  StoreBirthSuccessState(this.storeBirthModel);
}
class StoreBirthFailureState extends BirthsState {
  final String error;
  StoreBirthFailureState(this.error);
}

class UpdateBirthLaodingState extends BirthsState {}
class UpdateBirthSuccessState extends BirthsState {
  final UpdateBirthModel updateBirthModel;
  UpdateBirthSuccessState(this.updateBirthModel);
}
class UpdateBirthFailureState extends BirthsState {
  final String error;
  UpdateBirthFailureState(this.error);
}

class DeleteBirthLaodingState extends BirthsState {}
class DeleteBirthSuccessState extends BirthsState {
  final DeleteBirthModel deleteBirthModel;
  DeleteBirthSuccessState(this.deleteBirthModel);
}
class DeleteBirthFailureState extends BirthsState {
  final String error;
  DeleteBirthFailureState(this.error);
}
