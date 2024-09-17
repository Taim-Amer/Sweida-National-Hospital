

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';
import 'package:hospital_management_system/features/medstorekeeper/cubit/medstorekeeperState.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/styles/colors.dart';
import 'custom_Recource_Add_Dialog.dart';
import '../../cubit/medstorekeeperCubit.dart';

class CustomAddResourceButton extends StatelessWidget{
  CustomAddResourceButton({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController end_date = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController availability_status = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return BlocConsumer< MedstorekeeperCubit , medstorekeeperState>(
     listener: (context , state){
       if(state is StoreRecourceSuccessState)
         showToast("تمت إضافة الدواء بنجاح", ToastState.SUCCESS);
       else if(state is StoreRecourceFailureState)
         showToast("حدث خطأ ما يرجى المحاولة مجدداً", ToastState.ERROR);
     },
     builder: (context , state){
       return Container(
         height: 50,
         decoration: BoxDecoration(
           color: Colors.greenAccent,
           boxShadow: [
             BoxShadow(
               color: defaultLightColor.withOpacity(0.1),
               spreadRadius: 2,
               blurRadius: 4,
               offset: const Offset(0, 3),
             ),
           ],
           borderRadius: BorderRadius.circular(20),
         ),
         child: MaterialButton(
           onPressed: () {
             showRecourceAddDialog(context, nameController,end_date , company , quantity , availability_status);
           },
           splashColor: Colors.transparent,
           child: const ListTile(
             leading: Icon(Iconsax.add, color: thirdColor),
             title: Text(
               "اضافة",
               style: TextStyle(
                 fontSize:  18,
                 color: thirdColor,
               ),
             ),
           ),
         ),
       );
     },
   );
  }

}