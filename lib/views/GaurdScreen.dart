import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gfrs/Component/widget/AskPermission.dart';
import 'package:gfrs/Component/widget/NetworkFailure.dart';
import 'package:gfrs/Provider/AttendieProvider.dart';
import 'package:gfrs/utils/assets.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class GaurdAttendanceScreen extends StatefulWidget {
  const GaurdAttendanceScreen({super.key});

  @override
  _GaurdAttendanceScreenState createState() => _GaurdAttendanceScreenState();
}

class _GaurdAttendanceScreenState extends State<GaurdAttendanceScreen> {
  StreamSubscription? _internetCheckStreamSubscription;

  Future<void> checkPermissionsAndInternet() async {
    final status = await Permission.camera.status;
    if (status.isDenied || status.isLimited || status.isRestricted) {
      showDialog(
        context: context,
        builder: (context) => DialogBox(
          tap: () {
            Permission.camera.request();
            Navigator.pop(context);
          },
        ),
      );
    }

    _internetCheckStreamSubscription =
        InternetConnection().onStatusChange.listen((status) {
      if (status == InternetStatus.disconnected) {
        showDialog(
          context: context,
          builder: (context) => const InternetErrorDialogBox(),
        );
      }
    });
  }

  @override
  void initState() {
    checkPermissionsAndInternet();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _internetCheckStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assets.primary_Color,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Guard Face Recognition System",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Consumer<AttendieProvider>(
          builder:
              (BuildContext context, AttendieProvider value, Widget? child) =>
                  Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              value.isLoading
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      height: 400,
                      width: 300,
                      child: const NutsActivityIndicator(
                        activeColor: Colors.indigo,
                        inactiveColor: Colors.blueGrey,
                        tickCount: 24,
                        relativeWidth: 0.4,
                        radius: 30,
                        startRatio: 0.7,
                        animationDuration: Duration(milliseconds: 500),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        value.markAttendance(context);
                      },
                      onLongPress: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        height: 400,
                        width: 300,
                        child: const Center(
                            child: Text(
                          'Mark Attendance',
                          style: TextStyle(
                              color: assets.primary_Color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
              const SizedBox(
                height: 150,
              ),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Marked",
                    style: TextStyle(
                        color: value.isLoading ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
