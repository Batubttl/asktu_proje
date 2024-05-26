import 'package:asktu_proje/Asktu_Proje/auth/auth_service.dart';
import 'package:asktu_proje/Asktu_Proje/data/database_manager.dart';
import 'package:asktu_proje/Asktu_Proje/data/user_model.dart';
import 'package:asktu_proje/Asktu_Proje/widgets/gauge_widget.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  late Stream<StepCount> stepCountStream;
  late Stream<PedestrianStatus> pedestrianStatusStream;
  String status = '?';
  int steps = 0;
  final maxSteps = 10000;
  double caloriesBurned = 0;
  final maxCaloriesBurned = 642;
  int distanceMeters = 0;
  final maxDistanceMeters = 7000;
  late UserModel _user;
  bool _isLoading = true;

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      steps = event.steps;
      calculateCaloriesBurned();
    });
    if (steps == maxSteps) {
      _showCongratsAlert(context);
    }
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    debugPrint('onPedestrianStatusError: $error');
    setState(() {
      status = 'Pedestrian Status not available';
    });
    debugPrint(status);
  }

  void onStepCountError(error) {
    debugPrint('onStepCountError: $error');
  }

  void initPlatformState() {
    pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    stepCountStream = Pedometer.stepCountStream;
    stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  void calculateCaloriesBurned() {
    if (_user.height > 0 && _user.weight > 0 && _user.age > 0) {
      double bmr;

      if (_user.gender == 'Erkek') {
        bmr = 88.362 +
            (13.397 * _user.weight) +
            (4.799 * _user.height) -
            (5.677 * _user.age);
      } else {
        bmr = 447.593 +
            (9.247 * _user.weight) +
            (3.098 * _user.height) -
            (4.330 * _user.age);
      }

      double caloriesBurned = (steps / 20) * bmr / 24 / 60;
      setState(() {
        this.caloriesBurned = caloriesBurned;
        distanceMeters = (steps * 0.7).toInt();
      });
    }
  }

  Future<void> _fetchUserData() async {
    String userId = AuthService().user!.uid;
    UserModel user = await DatabaseManager().getUserData(userId);
    setState(() {
      _user = user;
      _isLoading = false;
    });
    calculateCaloriesBurned();
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ASKTU"),
        centerTitle: true,
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GaugeWidget(
                      value: steps.toDouble(),
                      maxValue: maxSteps.toDouble(),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Adım Sayısı",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 120),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              GaugeWidget(
                                value: caloriesBurned,
                                maxValue: maxCaloriesBurned.toDouble(),
                                radius: 50,
                                thickness: 16,
                                icon: const Icon(
                                  Icons.local_fire_department_rounded,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${caloriesBurned.toStringAsFixed(0)} cal\nKalori",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              GaugeWidget(
                                value: distanceMeters.toDouble(),
                                maxValue: maxDistanceMeters.toDouble(),
                                radius: 50,
                                thickness: 16,
                                icon: const Icon(
                                  Icons.location_on,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "$distanceMeters m\nMesafe",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 64),
                      child: Row(
                        children: [
                          Text(
                            "${_user.height.toInt()}\nBoy",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${_user.age.toInt()}\nYaş",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${_user.weight.toInt()}\nKilo",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> _showCongratsAlert(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tebrikler'),
          content: const SizedBox(
            width: 400,
            height: 120,
            child: Center(
              child: Text('Hedefinize ulaştınız!'),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Kapat'),
              onPressed: () {
                Navigator.of(context).pop(); // dismiss dialog
              },
            ),
          ],
        );
      },
    );
  }
}

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}
