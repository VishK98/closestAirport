import 'dart:core';
import 'package:flutter/material.dart';
class AirportModel {
  String? airport;
  String? city;
  String? state;
  Duration? drivingTime;
  String? airportCode;
  double? drivingDist;
  double? flightDist;
  Duration? totalDriveAndFlyTime;
  double? runwayLength;
  double? fuel;
  String? closestHotel;
  String? surfacePCN;
  String? drivingDirection; //need to be changed to LatLNG

  AirportModel(
      {this.airport,
      this.airportCode,
      this.city,
      this.closestHotel,
      this.drivingDirection,
      this.drivingDist,
      this.drivingTime,
      this.flightDist,
      this.fuel,
      this.runwayLength,
      this.state,
      this.surfacePCN,
      this.totalDriveAndFlyTime});
}
