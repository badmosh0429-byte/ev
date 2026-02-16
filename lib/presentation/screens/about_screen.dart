import 'package:flutter/material.dart';
import '../../core/widgets/app_bar_widget.dart';
import '../../core/constants/app_constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.school, size: 80, color: Color(0xFF006400)),
              const SizedBox(height: 30),
              const Text(
                AppConstants.institutionName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              _buildInfoRow('Developed By:', AppConstants.developerName),
              _buildInfoRow('Session:', AppConstants.developerSession),
              _buildInfoRow('Roll No:', AppConstants.developerRollNo),
              _buildInfoRow('Program:', AppConstants.developerProgram),
              const SizedBox(height: 20),
              _buildInfoRow('App Version:', AppConstants.appVersion),
              _buildInfoRow('Build:', AppConstants.buildVersion),
              const SizedBox(height: 30),
              const Text(
                'Offline Academic Management System',
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label ',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(value),
        ],
      ),
    );
  }
}
