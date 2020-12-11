import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GPS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetLocationPage(),
    );
  }
}

class GetLocationPage extends StatefulWidget {
  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
  LocationData _currentLocation;
  Location _locationService = new Location();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getLocation().then((value) {
      setState(() {
        _currentLocation = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _currentLocation == null
                ? CircularProgressIndicator()
                : Text("Location:" +
                    _currentLocation.latitude.toString() +
                    " " +
                    _currentLocation.longitude.toString()),


          ],
        ),
      ),
    );
  }

  Future<LocationData> _getLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await _locationService.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
