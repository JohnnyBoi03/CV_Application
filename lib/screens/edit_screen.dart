// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import '../models/cv_details.dart';

class CvEdit extends StatefulWidget {
  final CvDetails cvDetails;
  final Function(CvDetails) onSave;

  CvEdit({required this.cvDetails, required this.onSave});

  @override
  _CvEditState createState() => _CvEditState();
}

class _CvEditState extends State<CvEdit> {
  ValueNotifier<String> slackProfilePictureUrl = ValueNotifier('');
  TextEditingController slackProfilePictureController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController slackUsernameController = TextEditingController();
  TextEditingController githubHandleController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.cvDetails.fullName;
    jobDescriptionController.text = widget.cvDetails.jobDescription;
    slackUsernameController.text = widget.cvDetails.slackUsername;
    githubHandleController.text = widget.cvDetails.githubHandle;
    bioController.text = widget.cvDetails.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Navigation
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MaterialButton(
                        minWidth: 60,
                        onPressed: () {
                          CvDetails updatedDetails = CvDetails(
                            imageWidget:
                                Image.network(slackProfilePictureUrl.value),
                            fullName: fullNameController.text,
                            jobDescription: jobDescriptionController.text,
                            slackUsername: slackUsernameController.text,
                            githubHandle: githubHandleController.text,
                            bio: bioController.text,
                          );
                          widget.onSave(updatedDetails);
                          Navigator.pop(context);
                        },
                        color: Color(0xFF8A5FC0),
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 64,
                  ),

                  // Slack profile picture
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: OvalBorder(),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: ValueListenableBuilder<String>(
                            valueListenable: slackProfilePictureUrl,
                            builder: (context, url, child) {
                              if (url.isEmpty) {
                                // Display a placeholder image when the URL is empty
                                return Image.network(
                                    'https://ca.slack-edge.com/T05FFAA91JP-U05R9BVM9FV-b44f447886e5-512'); // Replace with your placeholder image
                              } else {
                                return Image.network(
                                  url,
                                  key: UniqueKey(),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: slackProfilePictureController,
                          decoration: InputDecoration(
                            labelText: 'Slack Profile Picture link',
                            hintText: 'https//...',
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              slackProfilePictureUrl.value = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'i.e Mark Essien',
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: jobDescriptionController,
                    decoration: InputDecoration(
                      labelText: 'Job Description',
                      hintText: 'i.e Mobile developer',
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: slackUsernameController,
                    decoration: InputDecoration(
                      labelText: 'Slack Username',
                      hintText: 'i.e jxcodie',
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: githubHandleController,
                    decoration: InputDecoration(
                      labelText: 'GitHub Handle',
                      hintText: 'i.e HNGx@github.com',
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: bioController,
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      hintText: 'i.e about yourself',
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// appBar: AppBar(
//         title: Text('Edit CV'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.save),
//             onPressed: () {
//               CvDetails updatedDetails = CvDetails(
//                 imageWidget: Image.network(''),
//                 fullName: fullNameController.text,
//                 jobDescription:jobDescriptionController.text ,
//                 slackUsername: slackUsernameController.text,
//                 githubHandle: githubHandleController.text,
//                 bio: bioController.text,
//               );
//               widget.onSave(updatedDetails);
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
