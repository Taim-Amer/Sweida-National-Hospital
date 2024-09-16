part of 'surgery_cubit.dart';

class SurgeryState {
  final AllEmergencySurgeryModel? allEmergencySurgeryModel;
  final AllRegularSurgeryModel? allRegularSurgeryModel;
  final bool isLoadingEmergencySurgery;
  final bool isLoadingRegularSurgery;
  final String? error;

  SurgeryState({
    this.allEmergencySurgeryModel,
    this.allRegularSurgeryModel,
    this.isLoadingEmergencySurgery = false,
    this.isLoadingRegularSurgery = false,
    this.error,
  });

  SurgeryState copyWith({
    AllEmergencySurgeryModel? allEmergencySurgeryModel,
    AllRegularSurgeryModel? allRegularSurgeryModel,
    bool? isLoadingEmergencySurgery,
    bool? isLoadingRegularSurgery,
    String? error,
  }) {
    return SurgeryState(
      allEmergencySurgeryModel: allEmergencySurgeryModel ?? this.allEmergencySurgeryModel,
      allRegularSurgeryModel: allRegularSurgeryModel ?? this.allRegularSurgeryModel,
      isLoadingEmergencySurgery: isLoadingEmergencySurgery ?? this.isLoadingEmergencySurgery,
      isLoadingRegularSurgery: isLoadingRegularSurgery ?? this.isLoadingRegularSurgery,
      error: error ?? this.error,
    );
  }
}

class SurgeryInitial extends SurgeryState {}

// Add Regular Surgery
class AddRegularSurgeryLoadingState extends SurgeryState {}
class AddRegularSurgerySuccessState extends SurgeryState {
  final AddRegularSurgeryModel addRegularSurgeryModel;
  AddRegularSurgerySuccessState(this.addRegularSurgeryModel);
}
class AddRegularSurgeryFailureState extends SurgeryState {
  final String error;
  AddRegularSurgeryFailureState(this.error);
}

// Add Emergency Surgery
class AddEmergencySurgeryLoadingState extends SurgeryState {}
class AddEmergencySurgerySuccessState extends SurgeryState {
  final AddEmergencySurgeryModel addEmergencySurgeryModel;
  AddEmergencySurgerySuccessState(this.addEmergencySurgeryModel);
}
class AddEmergencySurgeryFailureState extends SurgeryState {
  final String error;
  AddEmergencySurgeryFailureState(this.error);
}

// All Regular Surgery
class AllRegularSurgeryLoadingState extends SurgeryState {}
class AllRegularSurgerySuccessState extends SurgeryState {
  final AllRegularSurgeryModel allRegularSurgeryModel;
  AllRegularSurgerySuccessState(this.allRegularSurgeryModel);
}
class AllRegularSurgeryFailureState extends SurgeryState {
  final String error;
  AllRegularSurgeryFailureState(this.error);
}

// All Emergency Surgery
class AllEmergencySurgeryLoadingState extends SurgeryState {}
class AllEmergencySurgerySuccessState extends SurgeryState {
  final AllEmergencySurgeryModel allEmergencySurgeryModel;
  AllEmergencySurgerySuccessState(this.allEmergencySurgeryModel);
}
class AllEmergencySurgeryFailureState extends SurgeryState {
  final String error;
  AllEmergencySurgeryFailureState(this.error);
}
