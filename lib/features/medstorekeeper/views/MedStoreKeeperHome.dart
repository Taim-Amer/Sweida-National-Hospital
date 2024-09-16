//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hospital_management_system/features/medstorekeeper/cubit/medstorekeeperCubit.dart';
// import 'package:hospital_management_system/features/medstorekeeper/cubit/medstorekeeperState.dart';
//
// import '../../../core/styles/colors.dart';
// import '../../../core/styles/sizes.dart';
//
// class MedStoreKeeperHome extends StatelessWidget{
//   MedStoreKeeperHome({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(providers: [
//       BlocProvider(create: (context){
//
//       return MedstorekeeperCubit()..getallresources();
//     }),
//     ],
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [
//                 defaultLightColor.withOpacity(0.75),
//                 Colors.white,
//                 secondDarkColor.withOpacity(0.3),
//               ],
//             ),
//           ),
//           child: Scaffold(
//             backgroundColor: Colors.transparent,
//             body: Padding(
//               padding: const EdgeInsets.all(Sizes.defaultSpace),
//               child: Column(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: SizedBox(
//                       height: 70,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: 3,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.only(right: Sizes.spaceBtwItems),
//                             child: Container(
//                               width: 520,
//                               height: 200,
//                               decoration: BoxDecoration(
//                                   color: backgroundColor,
//                                   borderRadius: BorderRadius.circular(20)
//                               ),
//                               child: Image(
//                                 fit: BoxFit.cover,
//                                 image: NetworkImage(
//                                   logos[index],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: Sizes.spaceBtwSections),
//                   Expanded(
//                     flex: 6,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: BlocBuilder<MedstorekeeperCubit, medstorekeeperState>(
//                             builder: (context, state) {
//                               if (state is Get_all_resourcesSuccessState) {
//                                   if(state.getallresources != null)
//                                       return CustomMedResourceList(allEmergencyPatientModel: state.getallresources!);
//                               }
//                               return const SizedBox();
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: Sizes.spaceBtwSections),
//                         Expanded(
//                           flex: 2,
//                           child: BlocBuilder<DepartmentsCubit, DepartmentsState>(
//                             builder: (context, state){
//                               if(state.allPatientInDepartmentModel != null){
//                                 return CustomRegularPatientList(allPatientInDepartmentModel: state.allPatientInDepartmentModel!);
//                               }
//                               return const SizedBox();
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//     );
//   }
//
// }