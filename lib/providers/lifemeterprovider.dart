import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lifemeter/constants/expectancy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LifeMeterProvider extends ChangeNotifier {
  late SharedPreferences prefs;
  Timer? _timer;

  bool alreadySet = false; // Indicates if the data is already set
  String _country = "Nepal";
  DateTime? _dob = DateTime.parse("2000-01-01");

  int totalDays = 0;
  int currentDay = 0;
  int remainingDays = 0;
  double percentage = 0.0;

  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;

  // Getters for time variables
  int get hours => _hours;
  int get minutes => _minutes;
  int get seconds => _seconds;

  // Getter for country
  String get country => _country;
  // Getter for date of birth in "yyyy-MM-dd" format
  String get dob => _dob?.toString().split(" ").first ?? "";

  // Constructor
  LifeMeterProvider() {
    loadPreferences();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Load preferences from SharedPreferences
  Future<void> loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    alreadySet = prefs.containsKey("country") && prefs.containsKey("dob");

    if (alreadySet) {
      _country = prefs.getString("country") ?? _country;
      final date = prefs.getString("dob") ?? "";
      _dob = DateTime.tryParse(date) ?? _dob;
    }
    notifyListeners();
  }

  // Set data and save to SharedPreferences
  Future<void> setData(String country, String date) async {
    prefs = await SharedPreferences.getInstance();
    _country = country;
    _dob = DateTime.parse(date);
    await prefs.setString("dob", date);
    await prefs.setString("country", country);
    notifyListeners();
  }

  void setTrue() {
    alreadySet = true;
    notifyListeners();
  }

  // Calculate days statistics
  void calculateDays() {
    if (_dob == null) return;

    final now = DateTime.now();
    final totalDaysDate = _dob!
        .add(Duration(days: countryLifeExpectancy[_country]!.toInt() * 365));
    totalDays =
        totalDaysDate.difference(_dob!).inDays; // Total days in life expectancy
    currentDay = now.difference(_dob!).inDays; // Days lived so far
    remainingDays = totalDays - currentDay; // Remaining days
    percentage = currentDay / totalDays; // Percentage of life lived
  }

  // Evaluate remaining time
  void evalTime() {
    if (_dob == null) return;

    final now = DateTime.now();
    final totalDaysDate = _dob!
        .add(Duration(days: countryLifeExpectancy[_country]!.toInt() * 365));
    final remainingTime = totalDaysDate.difference(now);
    _hours = remainingTime.inHours;
    _minutes = remainingTime.inMinutes.remainder(60);
    _seconds = remainingTime.inSeconds.remainder(60);
    notifyListeners();
  }

  // Update information and notify listeners
  void updateInfo() {
    calculateDays();
    evalTime();
  }

  // Start timer to update the time every second
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updateInfo();
    });
  }
}
