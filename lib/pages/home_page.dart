import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_disease_mobile_app/bloc/cubit/heart_disease_cubit.dart';
import 'package:heart_disease_mobile_app/models/heart_disease_model.dart';
import 'package:heart_disease_mobile_app/service/api_service.dart';
import 'package:heart_disease_mobile_app/widgets/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController cholesterolController = TextEditingController();

  // Form fields
  late int age;
  late int sex; // 0 for female, 1 for male
  late int bloodPressure;
  late int cholesterol;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            HeartDiseaseCubit(repository: HeartDiseaseService()),
        child: BlocListener<HeartDiseaseCubit, HeartDiseaseState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Builder(
                    builder: (context) {
                      return CustomTextField(
                        hintext: "Age",
                        label: Text('Age'),
                        icon: Icon(Icons.abc_sharp),
                        controller: ageController,
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      return CustomTextField(
                        hintext: "sex",
                        label: Text('sex'),
                        icon: Icon(Icons.abc_sharp),
                        controller: sexController,
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      return CustomTextField(
                        hintext: "BP",
                        label: Text('BP'),
                        icon: Icon(Icons.abc_sharp),
                        controller: bloodPressureController,
                      );
                    },
                  ),
                  Builder(
                    builder: (context) {
                      return CustomTextField(
                        hintext: "Chol",
                        label: Text('Chol'),
                        icon: Icon(Icons.abc_sharp),
                        controller: cholesterolController,
                      );
                    },
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          // final input = HeartDiseaseModel(age: ageController.text as int, sex: sex, )
                        },
                        child: Text('Predict')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
