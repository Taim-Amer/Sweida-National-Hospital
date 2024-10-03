// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hospital_management_system/core/styles/sizes.dart';
// import 'package:hospital_management_system/core/widgets/custom_button.dart';
// import 'package:hospital_management_system/core/widgets/custom_date_picker.dart';
// import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
// import 'package:hospital_management_system/features/human_resources/cubit/human_resources_cubit.dart';
//
// class CustomAbsentLeaveFilterRow extends StatelessWidget {
//   CustomAbsentLeaveFilterRow({super.key});
//
//   var dateController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         CustomDatePicker(
//           dateController: dateController,
//           width: 300,
//           hint: "بداية الاجازات",
//         ),
//         const SizedBox(width: Sizes.sm),
//         BlocConsumer<HumanResourcesCubit, HumanResourcesState>(
//             listener: (context, state) {
//               if(state is AllAbsentInDateSuccessState){
//                 showCustomAllLeaveDialog
//               }else if(state is AllAbsentInDateFailureState){
//                 showToast("لا يوجد اي اجازات", ToastState.ERROR);
//               }
//             },
//             builder: (context, state) {
//               return CustomButton(function: () {}, text: "بحث", width: 100);
//             },
//         )
//       ],
//     );
//   }
// }
