import 'package:flutter/material.dart';
class CvDetails {
   late String slackProfilePictureUrl;
  Widget imageWidget;
  String fullName;
  String jobDescription;
  String slackUsername;
  String githubHandle;
  String bio;

  CvDetails({
    required this.imageWidget,
    required this.fullName,
    required this.jobDescription,
    required this.slackUsername,
    required this.githubHandle,
    required this.bio,
  });
}
