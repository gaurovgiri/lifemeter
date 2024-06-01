import 'package:flutter/material.dart';
import 'package:lifemeter/providers/lifemeterprovider.dart';
import 'package:lifemeter/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class Inputs extends StatefulWidget {
  Inputs({super.key});

  @override
  _InputsState createState() => _InputsState();
}

class _InputsState extends State<Inputs> {
  final List<String> countries = [
    'Nepal',
    'India',
    'USA',
    'Canada',
    'Australia'
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LifeMeterProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Country",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double
              .infinity, // Makes the dropdown take the full width of its parent
          child: DropdownButton<String>(
            value: provider.country,
            isExpanded: true, // Dropdown button expands to fill the container
            onChanged: (newValue) {
              if (newValue != null) {
                provider.setData(newValue, provider.dob);
              }
            },
            items: countries.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Date of Birth",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: TextButton(
            onPressed: () => _selectDate(context, provider),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    provider.dob,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),
                const Icon(Icons.calendar_today), // Calendar icon
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: GestureDetector(
            onTap: () => _navigateToHome(context),
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: const Color(0xFF2DB073), // Same color as oval
              ),
              child: const Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(
      BuildContext context, LifeMeterProvider provider) async {
    final DateTime initialDate = DateTime.parse(provider.dob);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != DateTime.tryParse(provider.dob)) {
      provider.setData(provider.country, picked.toIso8601String());
    }
  }

  void _navigateToHome(BuildContext context) {
    final provider = Provider.of<LifeMeterProvider>(context, listen: false);
    provider.notify();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
