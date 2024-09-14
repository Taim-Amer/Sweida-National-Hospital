part of 'tests_cubit.dart';

abstract class TestsState {}

class TestsInitial extends TestsState {}

// Regular Test
class RegularTestRequestLoadingState extends TestsState {}
class RegularTestRequestSuccessState extends TestsState {
  final RegularTestRequestModel regularTestRequestModel;
  RegularTestRequestSuccessState(this.regularTestRequestModel);
}
class RegularTestRequestFailureState extends TestsState {
  final String error;
  RegularTestRequestFailureState(this.error);
}

// Regular XRay
class RegularXRayRequestLoadingState extends TestsState {}
class RegularXRayRequestSuccessState extends TestsState {
  final RegularXrayRequestModel regularXrayRequestModel;
  RegularXRayRequestSuccessState(this.regularXrayRequestModel);
}
class RegularXRayRequestFailureState extends TestsState {
  final String error;
  RegularXRayRequestFailureState(this.error);
}

// Emergency XRay
class EmergencyXRayRequestLoadingState extends TestsState {}
class EmergencyXRayRequestSuccessState extends TestsState {
  final EmergencyXrayRequestModel emergencyXrayRequestModel;
  EmergencyXRayRequestSuccessState(this.emergencyXrayRequestModel);
}
class EmergencyXRayRequestFailureState extends TestsState {
  final String error;
  EmergencyXRayRequestFailureState(this.error);
}

// Emergency Test
class EmergencyTestRequestLoadingState extends TestsState {}
class EmergencyTestRequestSuccessState extends TestsState {
  final EmergencyTestRequestModel emergencyTestRequestModel;
  EmergencyTestRequestSuccessState(this.emergencyTestRequestModel);
}
class EmergencyTestRequestFailureState extends TestsState {
  final String error;
  EmergencyTestRequestFailureState(this.error);
}

// All Emergency Test
class AllEmergencyTestLoadingState extends TestsState {}
class AllEmergencyTestSuccessState extends TestsState {
  final AllEmergencyTestsModel allEmergencyTestsModel;
  AllEmergencyTestSuccessState(this.allEmergencyTestsModel);
}
class AllEmergencyTestFailureState extends TestsState {
  final String error;
  AllEmergencyTestFailureState(this.error);
}

// All Regular Test
class AllRegularTestLoadingState extends TestsState {}
class AllRegularTestSuccessState extends TestsState {
  final AllRegularTestsModel allRegularTestsModel;
  AllRegularTestSuccessState(this.allRegularTestsModel);
}
class AllRegularTestFailureState extends TestsState {
  final String error;
  AllRegularTestFailureState(this.error);
}

// All Regular Xray
class AllRegularXrayLoadingState extends TestsState {}
class AllRegularXraySuccessState extends TestsState {
  final AllRegularXrayModel allRegularXrayModel;
  AllRegularXraySuccessState(this.allRegularXrayModel);
}
class AllRegularXrayFailureState extends TestsState {
  final String error;
  AllRegularXrayFailureState(this.error);
}

// All Emergency Xray
class AllEmergencyXrayLoadingState extends TestsState {}
class AllEmergencyXraySuccessState extends TestsState {
  final AllEmergencyXrayModel allEmergencyXrayModel;
  AllEmergencyXraySuccessState(this.allEmergencyXrayModel);
}
class AllEmergencyXrayFailureState extends TestsState {
  final String error;
  AllEmergencyXrayFailureState(this.error);
}

// Get Regular Test
class GetRegularTestLoadingState extends TestsState {}
class GetRegularTestSuccessState extends TestsState {
  final GetRegularTestModel getRegularTestModel;
  GetRegularTestSuccessState(this.getRegularTestModel);
}
class GetRegularTestFailureState extends TestsState {
  final String error;
  GetRegularTestFailureState(this.error);
}

// Get Regular Xray
class GetRegularXrayLoadingState extends TestsState {}
class GetRegularXraySuccessState extends TestsState {
  final GetRegularXrayModel getRegularXrayModel;
  GetRegularXraySuccessState(this.getRegularXrayModel);
}
class GetRegularXrayFailureState extends TestsState {
  final String error;
  GetRegularXrayFailureState(this.error);
}

// Get Emergency Xray
class GetEmergencyXrayLoadingState extends TestsState {}
class GetEmergencyXraySuccessState extends TestsState {
  final GetEmergencyXrayModel getEmergencyXrayModel;
  GetEmergencyXraySuccessState(this.getEmergencyXrayModel);
}
class GetEmergencyXrayFailureState extends TestsState {
  final String error;
  GetEmergencyXrayFailureState(this.error);
}

// Get Emergency Test
class GetEmergencyTestLoadingState extends TestsState {}
class GetEmergencyTestSuccessState extends TestsState {
  final GetEmergencyTestModel getEmergencyTestModel;
  GetEmergencyTestSuccessState(this.getEmergencyTestModel);
}
class GetEmergencyTestFailureState extends TestsState {
  final String error;
  GetEmergencyTestFailureState(this.error);
}

