import 'package:ems/models/location.dart';
import 'package:geolocator/geolocator.dart';

class Employees{
  final String id;
  final String orgId;
  final String email;
  final String empName;
  final String address;
  final String empContact;
  final Location destination;
  final int status;
  Employees({
    required this.id,
    required this.empName,
    required this.orgId,
    required this.email,
    required this.address,
    required this.empContact,
    required this.destination,
    required this.status,
  });
}