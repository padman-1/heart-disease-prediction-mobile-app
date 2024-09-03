import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heart_disease_mobile_app/bloc/cubit/heart_disease_cubit.dart';
import 'package:heart_disease_mobile_app/models/heart_disease_model.dart';
import 'package:heart_disease_mobile_app/service/api_service.dart';
import 'package:heart_disease_mobile_app/widgets/chest_pain_dropdown.dart';
import 'package:heart_disease_mobile_app/widgets/custom_textfield.dart';
import 'package:heart_disease_mobile_app/widgets/exang_dropdown.dart';
import 'package:heart_disease_mobile_app/widgets/fbs_dropdown.dart';
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
  int _selectedFbs = -1;
  int _selectedExang = -1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HeartDiseaseCubit(repository: HeartDiseaseService()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Heart Disease Prediction"),
          backgroundColor: Colors.white12,
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
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
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
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("An error occured. Couldn't make prediction")));
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 248, 248, 240),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/heart_logo.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text('Wanna make a prediction today?'),
                    SizedBox(
                      height: 20,
                    ),
                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: 'Enter your age',
                          label: const Text('Age'),
                          icon: const Icon(FontAwesomeIcons.calendarDays),
                          controller: ageController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your age';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid integer';
                            }
                            return null;
                          },
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

                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: "Enter your Resting blood Pressure",
                          label: Text('Resting blood Pressure(Trestbps)'),
                          icon: const Icon(FontAwesomeIcons.droplet),
                          controller: bloodPressureController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your resting blood pressure';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid integer';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: 'Enter your cholesterol level',
                          label: Text('Serum Cholesterol (Chol)'),
                          icon: const Icon(FontAwesomeIcons.vial),
                          controller: cholesterolController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your cholesterol level';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid integer';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    FbsDropdown(onFbsSelected: (FbsValue) {
                      setState(() {
                        _selectedFbs = FbsValue;
                        print(_selectedFbs);
                      });
                    }),

                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: 'Enter 0, 1 or 2 based on results',
                          label: const Text(
                            'Resting ECG Results (restecg)',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          icon: const Icon(FontAwesomeIcons.bedPulse),
                          controller: restecgController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value for Restecg';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid integer';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: 'Enter your maximum heart rate',
                          label: const Text(
                            'Max heart rate achieved(Thalach)',
                            style: TextStyle(fontSize: 15),
                          ),
                          icon: const Icon(FontAwesomeIcons.heartPulse),
                          controller: thalachController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your maximum heart rate';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid integer';
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    ExangDropdown(onExangSelected: (exangValue) {
                      setState(() {
                        _selectedExang = exangValue;
                        print(_selectedExang);
                      });
                    }),
                    // Builder(
                    //   builder: (context) {
                    //     return CustomTextField(
                    //       hintext: "exang",
                    //       label: Text('exang'),
                    //       icon: Icon(Icons.abc_sharp),
                    //       controller: exangController,
                    //     );
                    //   },
                    // ),
                    Builder(
                      builder: (context) {
                        return CustomTextField(
                          hintext: "Enter the value for ST depression",
                          label: Text('ST depression (oldPeak)'),
                          icon: const Icon(FontAwesomeIcons.personWalking),
                          controller: oldpeakController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value for Oldpeak';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid integer';
                            }
                            return null;
                          },
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
                          hintext: "Enter a value between 0 and 3",
                          label: const Text(
                            'Number of major Vessels ',
                            // style: TextStyle(fontSize: 15),
                          ),
                          icon: const Icon(FontAwesomeIcons.heartCircleBolt),
                          controller: caController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a value";
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid integer';
                            }
                            int? caValue = int.tryParse(value);
                            if (caValue == null || caValue < 0 || caValue > 3) {
                              return 'Value must be between 0 and 3';
                            }
                            return null;
                          },
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
                                if (_formKey.currentState!.validate()) {
                                  final input = HeartDiseaseModel(
                                    age: int.parse(ageController.text),
                                    sex: _selectedGender,
                                    cp: _selectedChestPain,
                                    trestbps:
                                        int.parse(bloodPressureController.text),
                                    chol: int.parse(cholesterolController.text),
                                    fbs: _selectedFbs,
                                    restecg: int.parse(restecgController.text),
                                    thalach: int.parse(thalachController.text),
                                    exang: _selectedExang,
                                    oldpeak:
                                        double.parse(oldpeakController.text),
                                    slope: _selectedSlope,
                                    ca: int.parse(caController.text),
                                    thal: _selectedThal,
                                  );
                                  print(input);
                                  context
                                      .read<HeartDiseaseCubit>()
                                      .predictHeartDisease(input);
                                }

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
