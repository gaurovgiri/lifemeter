import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LifeMeterProvider extends ChangeNotifier {
  late SharedPreferences prefs;

  bool alreadySet = false; // Initialize as false
  String _country = "Nepal";
  DateTime? _dob = DateTime.parse("2000-01-01");

  String get country => _country;
  String get dob => _dob.toString().split(" ").first;

  LifeMeterProvider() {
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    alreadySet = prefs.containsKey("country") &&
        prefs
            .containsKey("dob"); // Update alreadySet based on saved preferences
    if (alreadySet) {
      _country = prefs.getString("country") ?? "";
      final date = prefs.getString("dob") ?? "";
      _dob = DateTime.tryParse(date) ??
          DateTime(2000, 1, 1); // Provide a default date if parsing fails
    }
    notifyListeners();
  }

  void setData(String country, String date) async {
    prefs = await SharedPreferences.getInstance();
    _country = country;
    _dob = DateTime.parse(date); // Date Format: "2002-07-21"
    prefs.setString("dob", date);
    prefs.setString("country", country);
    notifyListeners();
  }

  void notify() {
    alreadySet = true; // Update alreadySet after setting data
    notifyListeners();
  }
}
