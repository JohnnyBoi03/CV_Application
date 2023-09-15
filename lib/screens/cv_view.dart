// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:cv_application/screens/edit_screen.dart';

import 'package:flutter/material.dart';
import '../models/cv_details.dart';

class CvView extends StatefulWidget {
  CvDetails cvDetails;

  CvView({required this.cvDetails});

  @override
  _CvViewState createState() => _CvViewState();
}

class _CvViewState extends State<CvView> {
  void _handleSave(CvDetails updatedDetails) {
    setState(() {
      widget.cvDetails = updatedDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 164,
                  left: 30,
                  right: 30,
                ),
                child: Column(
                  children: [
                    //Navigation
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'My CV',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
          
                        //Edit button
                        MaterialButton(
                          minWidth: 60,
                          onPressed: () async {
                            final updatedDetails = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CvEdit(
                                  cvDetails: widget.cvDetails,
                                  onSave: _handleSave,
                                ),
                              ),
                            );
          
                            // Handle updatedDetails if needed after returning from edit screen
                            if (updatedDetails != null) {
                              _handleSave(updatedDetails);
                            }
                          },
                          color: const Color(0xFF8A5FC0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Edit',
                            style:
                                TextStyle(fontSize: 12, color: Color(0xFFFFFFFF)),
                          ),
                          padding: const EdgeInsets.only(
                            bottom: 6,
                            left: 11.5,
                            right: 11.5,
                            top: 6,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 72,
                    ),
          
                    //Profile picture
                    Container(
                      width: 200,
                      height: 200,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: OvalBorder(),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: widget.cvDetails.imageWidget,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
          
                    //Full name
                    Text(
                      ' ${widget.cvDetails.fullName}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
          
                    //Job description
                    Text(
                      widget.cvDetails.jobDescription,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
          
                    //slack Username
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Slack Username: ',
                            style: TextStyle(
                                fontSize: 16,
                                color:
                                    Colors.black), // style for the label
                          ),
                          TextSpan(
                            text: '${widget.cvDetails.slackUsername}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .blue), // style for the Slack username
                          ),
                        ],
                      ),
                    ),
          
                    SizedBox(
                      height: 8,
                    ),
          
                    //Github Handle
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'GitHub Handle: ',
                            style: TextStyle(
                                fontSize: 16,
                                color:
                                    Colors.black), // Set the style for the label
                          ),
                          TextSpan(
                            text: '${widget.cvDetails.githubHandle}',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .blue), // Set the style for the GitHub handle
                          ),
                        ],
                      ),
                    ),
          
                    const SizedBox(
                      height: 24,
                    ),
          
                    //Profile
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child:  Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
          
                    //Bio
                    Text('${widget.cvDetails.bio}', style: TextStyle(fontSize: 15),),
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
