import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_system/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:hospital_management_system/core/styles/themes.dart';

class CustomRadioList extends StatelessWidget {
  const CustomRadioList({super.key,required this.options, required this.size, required this.controllers});

  final List<String> options;
  final double size;
  // final ScrollController controller;
  final List<TextEditingController> controllers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioCubit, RadioState>(
      builder: (context, state) {
        return SizedBox(
          height: size,
          child: ListView.builder(
            itemCount: options.length,
            // controller: controller,
            itemBuilder: (context, index) {
              return RadioListTile(
                title: Text(options[index]),
                value: index,
                activeColor: defaultColor,
                groupValue: RadioCubit.get(context).currentIndex,
                onChanged: (value) {
                  RadioCubit.get(context).changeRadioIndex(value ?? 0);
                  controllers[index].text = options[index];
                  // print(controllers[index].text);
                  // print(controllers[index].text);
                  // print(controllers[index].text);
                  // print(controllers[index].text);
                  // print(controllers[index].text);

                  RadioCubit.get(context).setChildrenOption(value == 0);
                },
              );
            },
          ),
        );
      },
    );
  }
}
