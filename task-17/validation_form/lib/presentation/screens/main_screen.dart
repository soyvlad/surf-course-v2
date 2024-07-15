import 'package:flutter/material.dart';
import 'package:validation_form/assets/app_colors.dart';
import 'package:validation_form/assets/app_strings.dart';
import 'package:validation_form/assets/app_txt_style.dart';
import 'package:validation_form/data/animal_list.dart';
import 'package:validation_form/data/enum_animals.dart';
import 'package:validation_form/data/list_vacs_made.dart';
import 'package:validation_form/widgets/txt_field_widgets/txtfield_calendar.dart';
import 'package:validation_form/widgets/txt_field_widgets/txtfield_email.dart';
import 'package:validation_form/widgets/txt_field_widgets/txtfield_name.dart';
import 'package:validation_form/widgets/txt_field_widgets/txtfield_weight.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<Animal> _controllerButtonAnimal =
      ValueNotifier<Animal>(Animal.dog);

  final ValueNotifier<bool> _checkIfAllFieldsAreFilled =
      ValueNotifier<bool>(false);

  final _formKeyName = GlobalKey<FormState>();
  final _controllerName = TextEditingController();

  final _formKeyWeight = GlobalKey<FormState>();
  final _controllerWeight = TextEditingController();

  final _formKeyEmail = GlobalKey<FormState>();
  final _controllerEmail = TextEditingController();
  bool _checkEmail = false;

  String _controllerDateBirthday = '';

  bool _sendForm = false;

  bool _isCheckedRabies = false;
  String _controllerRabies = '';

  bool _isCheckedCovid = false;
  String _controllerCovid = '';

  bool _isCheckedMalaria = false;
  String _controllerMalaria = '';

  @override
  void initState() {
    super.initState();
    _controllerButtonAnimal.value = Animal.dog;
  }

  void updateButtonAnimal(Animal animal) {
    _controllerButtonAnimal.value = animal;
    if (animal == Animal.hamster || animal == Animal.parrot) {
      _isCheckedRabies = false;
      _isCheckedCovid = false;
      _isCheckedMalaria = false;
    }
  }

  void updateDateBirthday(String date) {
    _controllerDateBirthday = date;
  }

  void updateEmailCheck(bool email) {
    _checkEmail = email;
  }

  void checkIfAllFieldsAreFilled() {
    bool allFieldsFilled = _controllerName.text.length > 2 &&
        _controllerWeight.text.isNotEmpty &&
        _checkEmail &&
        _controllerDateBirthday.isNotEmpty;

    if (_isCheckedRabies) {
      allFieldsFilled = _controllerRabies.isNotEmpty;
    } else {
      _controllerRabies = '';
    }

    if (_isCheckedCovid) {
      allFieldsFilled = _controllerCovid.isNotEmpty;
    } else {
      _controllerCovid = '';
    }

    if (_isCheckedMalaria) {
      allFieldsFilled = _controllerMalaria.isNotEmpty;
    } else {
      _controllerMalaria = '';
    }
    Future.microtask(() => _checkIfAllFieldsAreFilled.value = allFieldsFilled);
  }

  void updateCheckedRabies(bool check) {
    setState(() {
      _isCheckedRabies = check;
      checkIfAllFieldsAreFilled();
    });
  }

  void updateDateRabies(String date) {
    _controllerRabies = date;
  }

  void updateCheckedCovid(bool check) {
    setState(() {
      _isCheckedCovid = check;
      checkIfAllFieldsAreFilled();
    });
  }

  void updateDateCovid(String date) {
    _controllerCovid = date;
  }

  void updateCheckedMalaria(bool check) {
    setState(() {
      _isCheckedMalaria = check;
      checkIfAllFieldsAreFilled();
    });
  }

  void updateDateMalaria(String date) {
    _controllerMalaria = date;
  }

  Future _send() async {
    setState(() {
      _sendForm = !_sendForm;
    });
    _checkIfAllFieldsAreFilled.value = false;
    await Future.delayed(const Duration(seconds: 2));
    _checkIfAllFieldsAreFilled.value = true;
    setState(() {
      _sendForm = !_sendForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListAnimal(
                    controllerButtonAnimal: _controllerButtonAnimal,
                    updateButtonAnimal: updateButtonAnimal,
                    sendForm: _sendForm),
                const SizedBox(height: 32),
                TextFieldName(
                  keyForm: _formKeyName,
                  controller: _controllerName,
                  sendForm: _sendForm,
                  checkIfAllFieldsAreFilled: checkIfAllFieldsAreFilled,
                ),
                const SizedBox(height: 16),
                TextFieldBirthday(
                  sendForm: _sendForm,
                  updateDateBirthday: updateDateBirthday,
                  checkIfAllFieldsAreFilled: checkIfAllFieldsAreFilled,
                  title: AppStrings.petsBirthday,
                ),
                const SizedBox(height: 16),
                TextFieldWeight(
                  keyForm: _formKeyWeight,
                  controller: _controllerWeight,
                  sendForm: _sendForm,
                  checkIfAllFieldsAreFilled: checkIfAllFieldsAreFilled,
                ),
                const SizedBox(height: 16),
                TextFieldEmail(
                  keyForm: _formKeyEmail,
                  controller: _controllerEmail,
                  sendForm: _sendForm,
                  checkIfAllFieldsAreFilled: checkIfAllFieldsAreFilled,
                  updateEmailCheck: updateEmailCheck,
                ),
                ValueListenableBuilder<Animal>(
                  valueListenable: _controllerButtonAnimal,
                  builder: (context, value, child) {
                    if (value == Animal.dog || value == Animal.cat) {
                      return MadeVaccinations(
                        isCheckedRabies: _isCheckedRabies,
                        updateCheckedRabies: updateCheckedRabies,
                        controllerRabies: _controllerRabies,
                        updateDateRabies: updateDateRabies,
                        sendForm: _sendForm,
                        checkIfAllFieldsAreFilled: checkIfAllFieldsAreFilled,
                        isCheckedCovid: _isCheckedCovid,
                        updateCheckedCovid: updateCheckedCovid,
                        controllerCovid: _controllerCovid,
                        updateDateCovid: updateDateCovid,
                        isCheckedMalaria: _isCheckedMalaria,
                        updateCheckedMalaria: updateCheckedMalaria,
                        controllerMalaria: _controllerMalaria,
                        updateDateMalaria: updateDateMalaria,
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 24),
                ValueListenableBuilder<bool>(
                  valueListenable: _checkIfAllFieldsAreFilled,
                  builder: (context, value, child) {
                    bool check = value;
                    if (value) {
                      check = !_sendForm;
                    }
                    return GestureDetector(
                      onTap: () {
                        if (!_sendForm && value) {
                          _send();
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        decoration: BoxDecoration(
                          color: check
                              ? AppColors.ardentPink
                              : AppColors.veryPaleBlue,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              // Shadow color
                              color: AppColors.ardentPink
                                  .withOpacity(check ? 0.24 : 0),
                              // Shadow blur
                              blurRadius: 16,
                              // Shadow offset
                              offset: const Offset(0, 16),
                            ),
                          ],
                        ),
                        child: Center(
                            child: !_sendForm
                                ? Text(
                                    AppStrings.send,
                                    style: AppTextStyles.text18
                                        .copyWith(color: AppColors.white),
                                  )
                                : const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      color: AppColors.white,
                                    ),
                                  )),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
