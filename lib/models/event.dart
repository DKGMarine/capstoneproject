import 'package:flutter/foundation.dart';

class Event {
  final String id;
  final String name;
  final String numberOfTeams;
  final String startDate;
  final String endDate;
  final String targetGoal;
  final String location;
  final String time;
 

  Event({
    @required this.id,
    @required this.name,
    @required this.numberOfTeams,
    @required this.startDate,
    @required this.endDate,
    @required this.targetGoal,
    @required this.location,
    @required this.time,
  });
}

