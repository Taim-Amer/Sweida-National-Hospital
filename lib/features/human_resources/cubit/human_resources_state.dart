part of 'human_resources_cubit.dart';

abstract class HumanResourcesState {}

class HumanResourcesInitial extends HumanResourcesState {}

class EstablishAttendanceLoadingState extends HumanResourcesState{}
class EstablishAttendanceSuccessState extends HumanResourcesState{
  final EstablishAttendanceModel establishAttendanceModel;
  EstablishAttendanceSuccessState(this.establishAttendanceModel);
}
class EstablishAttendanceFailureState extends HumanResourcesState{
  final String error;
  EstablishAttendanceFailureState(this.error);
}

class AbsentLeftingLeaveLoadingState extends HumanResourcesState{}
class AbsentLeftingLeaveSuccessState extends HumanResourcesState{}
class AbsentLeftingLeaveFailureState extends HumanResourcesState{
  final String error;
  AbsentLeftingLeaveFailureState(this.error);
}

class AbsentPenaltyLoadingState extends HumanResourcesState{}
class AbsentPenaltySuccessState extends HumanResourcesState{}
class AbsentPenaltyFailureState extends HumanResourcesState{
  final String error;
  AbsentPenaltyFailureState(this.error);
}

class UpdateAttendanceLoadingState extends HumanResourcesState{}
class UpdateAttendanceSuccessState extends HumanResourcesState{
  final UpdateAttendanceModel updateAttendanceModel;
  UpdateAttendanceSuccessState(this.updateAttendanceModel);
}
class UpdateAttendanceFailureState extends HumanResourcesState{
  final String error;
  UpdateAttendanceFailureState(this.error);
}

class UpdateAbsentLoadingState extends HumanResourcesState{}
class UpdateAbsentSuccessState extends HumanResourcesState{
  final UpdateAbsentModel updateAbsentModel;
  UpdateAbsentSuccessState(this.updateAbsentModel);
}
class UpdateAbsentFailureState extends HumanResourcesState{
  final String error;
  UpdateAbsentFailureState(this.error);
}

class AllAttendanceInDateLoadingState extends HumanResourcesState{}
class AllAttendanceInDateSuccessState extends HumanResourcesState{
  final AllAttendanceInDateModel allAttendanceInDateModel;
  AllAttendanceInDateSuccessState(this.allAttendanceInDateModel);
}
class AllAttendanceInDateFailureState extends HumanResourcesState{
  final String error;
  AllAttendanceInDateFailureState(this.error);
}

class AllAbsentInDateLoadingState extends HumanResourcesState{}
class AllAbsentInDateSuccessState extends HumanResourcesState{
  final AllAbsentInDateModel allAbsentInDateModel;
  AllAbsentInDateSuccessState(this.allAbsentInDateModel);
}
class AllAbsentInDateFailureState extends HumanResourcesState{
  final String error;
  AllAbsentInDateFailureState(this.error);
}

class AllPenaltyInDateLoadingState extends HumanResourcesState{}
class AllPenaltyInDateSuccessState extends HumanResourcesState{
  final AllPenaltyInDateModel allPenaltyInDateModel;
  AllPenaltyInDateSuccessState(this.allPenaltyInDateModel);
}
class AllPenaltyInDateFailureState extends HumanResourcesState{
  final String error;
  AllPenaltyInDateFailureState(this.error);
}

class AddEmployeeLoadingState extends HumanResourcesState{}
class AddEmployeeSuccessState extends HumanResourcesState{}
class AddEmployeeFailureState extends HumanResourcesState{
  final String error;
  AddEmployeeFailureState(this.error);
}

class ShowEmployeeLoadingState extends HumanResourcesState{}
class ShowEmployeeSuccessState extends HumanResourcesState{
  final ShowEmployeeModel showEmployeeModel;
  ShowEmployeeSuccessState(this.showEmployeeModel);
}
class ShowEmployeeFailureState extends HumanResourcesState{
  final String error;
  ShowEmployeeFailureState(this.error);
}

class UpdateEmployeeLoadingState extends HumanResourcesState{}
class UpdateEmployeeSuccessState extends HumanResourcesState{}
class UpdateEmployeeFailureState extends HumanResourcesState{
  final String error;
  UpdateEmployeeFailureState(this.error);
}


class DeleteEmployeeLoadingState extends HumanResourcesState{}
class DeleteEmployeeSuccessState extends HumanResourcesState{
  final DeleteEmployeeModel deleteEmployeeModel;
  DeleteEmployeeSuccessState(this.deleteEmployeeModel);
}
class DeleteEmployeeFailureState extends HumanResourcesState{
  final String error;
  DeleteEmployeeFailureState(this.error);
}


class AllEmployeeLoadingState extends HumanResourcesState{}
class AllEmployeeSuccessState extends HumanResourcesState{
  final AllEmployeeModel allEmployeeModel;
  AllEmployeeSuccessState(this.allEmployeeModel);
}
class AllEmployeeFailureState extends HumanResourcesState{
  final String error;
  AllEmployeeFailureState(this.error);
}


