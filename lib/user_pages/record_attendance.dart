import 'dart:async';
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:med_intern/components/main_appbar.dart';
import 'package:med_intern/components/main_drawer.dart';
import 'package:med_intern/components/recbutton.dart';
import 'package:med_intern/components/roundbutton.dart';
import 'package:med_intern/main.dart';
import 'package:med_intern/theme/colors.dart';
import 'package:med_intern/theme/fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class RecordAttendace extends StatefulWidget {
  const RecordAttendace({super.key});

  @override
  State<RecordAttendace> createState() => _RecordAttendaceState();
}

class _RecordAttendaceState extends State<RecordAttendace> {
  GoogleMapController? mapController;
  Position? cl;
  var lat;
  var long;
  CameraPosition? _kGooglePlex;
  late Set<Marker> mymarker;

  getlocation() async {
    PermissionStatus status = await Permission.location.request();
    if (status == PermissionStatus.denied) {
      await Geolocator.requestPermission();
    }
    if (status == PermissionStatus.granted) {
      await getLatLong();
    }
  }

  getLatLong() async {
    cl = await Geolocator.getCurrentPosition().then((value) => (value));

    lat = cl?.latitude;
    long = cl?.longitude;

    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      tilt: 0.5,
      zoom: 30.4746,
    );
    setState(() {
      mymarker = {
        Marker(markerId: MarkerId("1"), position: LatLng(lat, long)),
        Marker(
            onDragEnd: ((LatLng) => {print(LatLng)}),
            markerId: MarkerId("1"),
            position: LatLng(lat, long))
      };
    });
  }

  void initState() {
    getlocation();

    super.initState();
  }

  Widget build(BuildContext context) {
    RecordAttendance() {
      // if recorded
      // AwesomeDialog(
      //   context: context,
      //   dialogType: DialogType.success,
      //   animType: AnimType.rightSlide,
      //   title: 'Confirmation message',
      //   desc: 'Your attendance recorded successfully',
      // )..show();
      // //else
      // AwesomeDialog(
      //   context: context,
      //   dialogType: DialogType.error,
      //   animType: AnimType.rightSlide,
      //   title: 'Confirmation message',
      //   desc:
      //       'Your attendance can\'t be recorded because you are not in the hospital area',
      // )..show();
    }

    return Scaffold(
      drawer: MainDrawer(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: MainAppBar(
            title: 'Record attendance',
          )),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 13),
        decoration: BoxDecoration(
          color: light_box_color,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Date:',
                    style: small_white_title,
                  ),
                  Text(
                    '20-11-2023',
                    style: small_black_title,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Time:',
                    style: small_white_title,
                  ),
                  Text(
                    '7:48',
                    style: small_black_title,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: _kGooglePlex != null
                ? Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        child: GoogleMap(
                          onTap: (LatLng) async {
                            setState(() {
                              mymarker.add(Marker(
                                  markerId: MarkerId("1"), position: LatLng));
                              lat = LatLng.latitude;
                              long = LatLng.longitude;
                            });
                            if (Geolocator.distanceBetween(18.231080, 42.501417,
                                    LatLng.latitude, LatLng.longitude) >=
                                5000) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.rightSlide,
                                title: 'Confirmation message',
                                desc: 'You are in the right range area',
                                btnOkText: 'confirm',
                                btnOkOnPress: () {
                                  FirebaseFirestore.instance
                                      .collection('not')
                                      .add({
                                    'title': 'Attendance recorded',
                                    'content': 'successfully done!',
                                    "date": "${DateTime.now()}",
                                    'userid': '${prefs!.getString('id')}'
                                  }).then((value) {
                                    Get.snackbar('Attendance recorded', '',
                                        backgroundColor: const Color.fromARGB(
                                            255, 195, 195, 195),
                                        titleText: Text(
                                          'Attendance recorded',
                                          style: small_black_title,
                                        ),
                                        messageText: Text(
                                          'successfully done!',
                                          style: small_black_title,
                                        ),
                                        snackPosition: SnackPosition.TOP);
                                    Navigator.of(context).pop();
                                  });
                                },
                              )..show();
                            } else {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Confirmation message',
                                desc:
                                    'Your attendance can\'t be recorded because you are not in the right area',
                              )..show();
                            }
                          },
                          markers: mymarker,
                          mapType: MapType.normal,
                          initialCameraPosition: _kGooglePlex!,
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                          },
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            height: MediaQuery.of(context).size.height / 3,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: RoundButton(
                fun: RecordAttendance,
                label: Text(
                  'Record attendance',
                  style: small_white_title,
                ),
                width: 200,
                height: 40,
                color: subcolor),
          )
        ]),
      ),
    );
  }
}
