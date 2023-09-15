import 'package:cv_application/screens/edit_screen.dart';
import 'package:flutter/material.dart';
import 'screens/cv_view.dart';
import 'models/cv_details.dart';
import 'screens/cv_view.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  CvDetails cvDetails = CvDetails(
    imageWidget: Image.network(
        'https://ca.slack-edge.com/T05FFAA91JP-U05R9BVM9FV-b44f447886e5-512'),
    fullName: 'Oluwatosin John',
    jobDescription: 'Mobile Developer',
    slackUsername: 'John Oluwatosin',
    githubHandle: 'github.com/JohnnyBoi03',
    bio: 'I am a passionate Flutter mobile developer with a strong background in building sleek, performant, and user-friendly applications. I thrive on challenges and am committed to delivering high-quality code on time. My expertise lies in creating cross-platform apps that run seamlessly on both iOS and Android devices.',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CvView(cvDetails: cvDetails),
      routes: {
        '/edit': (context) => CvEdit(
              cvDetails: cvDetails,
              onSave: (updatedDetails) {
                cvDetails = updatedDetails;
              },
            ),
      },
    );
  }
}
