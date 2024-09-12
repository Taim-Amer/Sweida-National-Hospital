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
