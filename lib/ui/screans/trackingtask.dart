import 'package:ems/constants.dart';
import 'package:ems/cores/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class TaskTracking extends StatefulWidget {
  const TaskTracking({Key? key}) : super(key: key);
  @override
  State<TaskTracking> createState() => TaskTrackingState();
}

class TaskTrackingState extends State<TaskTracking> {
  @override
  void initState() {
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initialization();
  }

  @override
  Widget build(BuildContext context) {
    final lp = Provider.of<LocationProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            trackingAppBarText,
          ),
          backgroundColor: appBarColor,
          elevation: 1000,
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 14, right: 10),
              child: const Text(
                "Distance: ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            lp.distanceBetweenPoints <= 600
                ? Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 30,
                    width: 30,
                    child: GestureDetector(
                      child: Image.asset('assets/check.png'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                                title: const Text('Task Submitted'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Ok"))
                                ],
                                content: Container(
                                  height: 120,
                                  width: 120,
                                  color: Colors.white,
                                  child: const SpinKitFadingCircle(
                                    color: Colors.blue,
                                    size: 80,
                                    duration: Duration(seconds: 1),
                                  ),
                                ),
          
                            );
                          },
                        );
                      },
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 15, right: 10),
                    child: Text(
                      lp.distanceBetweenPoints.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ],
        ),
      ),
      body: lp.locationPosition != null
          ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: lp.locationPosition!,
                zoom: 8.5,
              ),
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              markers: lp.markers,
              onMapCreated: (GoogleMapController controller) {},
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 3,
              ),
            ),
    );
  }
}
