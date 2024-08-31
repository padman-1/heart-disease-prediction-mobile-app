import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heart_disease_mobile_app/bloc/cubit/heart_disease_cubit.dart';
import 'package:heart_disease_mobile_app/models/heart_disease_model.dart';
import 'package:heart_disease_mobile_app/service/api_service.dart';
import 'package:heart_disease_mobile_app/widgets/chest_pain_dropdown.dart';
import 'package:heart_disease_mobile_app/widgets/custom_textfield.dart';
import 'package:heart_disease_mobile_app/widgets/gender_dropdown.dart';
import 'package:heart_disease_mobile_app/widgets/slope_dropdown.dart';
import 'package:heart_disease_mobile_app/widgets/thal_dropdown.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController chestPainController = TextEditingController();
  final TextEditingController bloodPressureController = TextEditingController();
  final TextEditingController cholesterolController = TextEditingController();
  final TextEditingController fbsController = TextEditingController();
  final TextEditingController restecgController = TextEditingController();
  final TextEditingController thalachController = TextEditingController();
  final TextEditingController exangController = TextEditingController();
  final TextEditingController oldpeakController = TextEditingController();
  final TextEditingController slopeController = TextEditingController();
  final TextEditingController caController = TextEditingController();
  final TextEditingController thalController = TextEditingController();

  // Form fields
  late int age;
  late int sex; // 0 for female, 1 for male
  late int bloodPressure;
  late int cholesterol;

  int _selectedGender = -1;
  int _selectedChestPain = -1;
  int _selectedSlope = -1;
  int _selectedThal = -1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HeartDiseaseCubit(repository: HeartDiseaseService()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Heart Disease Prediction"),
        ),
        body: BlocListener<HeartDiseaseCubit, HeartDiseaseState>(
          // listenWhen: (previous, current) => previous.Hear,
          listener: (context, state) {
            if (state is HeartDiseaseSuccess) {
              String confidence =
                  '${(state.prediction.probability * 100).toStringAsFixed(2)}%';
              showDialog(
                context: context,
                builder: (_) => BackdropFilter(
                  filter: ImageFilter.blur(),
                  child: AlertDialog(
                    title: Center(
                      child: Text('Results'),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.prediction.result),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Probability: ',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(
                                  text: confidence,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ]),
                        ),
                        // Text(state.prediction.prediction.toString()),
                        // Text(confidence),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is HeartDiseaseFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 248, 240),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Text("data"),
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
                    GenderDropdown(onGenderSelected: (int genderValue) {
                      setState(() {
                        _selectedGender = genderValue;
                        print(_selectedGender);
                      });
                    }),
                    ChestPainDropdown(
                        onChestPainSelected: (int chestPainValue) {
                      setState(() {
                        _selectedChestPain = chestPainValue;
                        print(_selectedChestPain);
                      });
                    }),
                    // Builder(
                    //   builder: (context) {
                    //     return CustomTextField(
                    //       hintext: "sex",
                    //       label: Text('sex'),
                    //       icon: Icon(Icons.abc_sharp),
                    //       controller: sexController,
                    //     );
                    //   },
                    // ),

                    // Builder(
                    //   builder: (context) {
                    //     return CustomTextField(
                    //       hintext: "ChestPain",
                    //       label: Text('ChestPain'),
                    //       icon: Icon(Icons.abc_sharp),
                    //       controller: chestPainController,
                    //     );
                    //   },
                    // ),
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
                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: "FBS",
                          label: Text('FBS'),
                          icon: Icon(Icons.abc_sharp),
                          controller: fbsController,
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: "restecg",
                          label: Text('restecg'),
                          icon: Icon(Icons.abc_sharp),
                          controller: restecgController,
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: "thalach",
                          label: Text('thalach'),
                          icon: Icon(Icons.abc_sharp),
                          controller: thalachController,
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: "exang",
                          label: Text('exang'),
                          icon: Icon(Icons.abc_sharp),
                          controller: exangController,
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: "oldPeak",
                          label: Text('oldPeak'),
                          icon: Icon(Icons.abc_sharp),
                          controller: oldpeakController,
                        );
                      },
                    ),
                    SlopeDropdown(onSlopeSelected: (int slopeValue) {
                      setState(() {
                        _selectedSlope = slopeValue;
                        print(_selectedSlope);
                      });
                    }),
                    // Builder(
                    //   builder: (context) {
                    //     return CustomTextField(
                    //       hintext: "slope",
                    //       label: Text('slope'),
                    //       icon: Icon(Icons.abc_sharp),
                    //       controller: slopeController,
                    //     );
                    //   },
                    // ),
                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: "ca",
                          label: Text('ca'),
                          icon: Icon(Icons.abc_sharp),
                          controller: caController,
                        );
                      },
                    ),
                    ThalDropdown(onThalSelected: (int thalValue) {
                      setState(() {
                        _selectedThal = thalValue;
                        print(_selectedThal);
                      });
                    }),
                    // Builder(
                    //   builder: (context) {
                    //     return CustomTextField(
                    //       hintext: "thal",
                    //       label: Text('thal'),
                    //       icon: Icon(Icons.abc_sharp),
                    //       controller: thalController,
                    //     );
                    //   },
                    // ),
                    Builder(
                      builder: (context) {
                        final isLoading =
                            context.select<HeartDiseaseCubit, bool>(
                                (value) => value.state is HeartDiseaseLoading);
                        if (isLoading) {
                          return const SizedBox(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        return SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                final input = HeartDiseaseModel(
                                  age: int.parse(ageController.text),
                                  sex: _selectedGender,
                                  cp: _selectedChestPain,
                                  trestbps:
                                      int.parse(bloodPressureController.text),
                                  chol: int.parse(cholesterolController.text),
                                  fbs: int.parse(fbsController.text),
                                  restecg: int.parse(restecgController.text),
                                  thalach: int.parse(thalachController.text),
                                  exang: int.parse(exangController.text),
                                  oldpeak: double.parse(oldpeakController.text),
                                  slope: _selectedSlope,
                                  ca: int.parse(caController.text),
                                  thal: int.parse(thalController.text),
                                );
                                print(input);
                                context
                                    .read<HeartDiseaseCubit>()
                                    .predictHeartDisease(input);
                                // final age = ageController.text;
                                // final sex = sexController.text;
                                // final BP = bloodPressureController.text;
                                // final chol = ageController.text;
                                // print(age);
                              },
                              child: Text('Predict')),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
