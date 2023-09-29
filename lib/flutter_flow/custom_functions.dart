import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String getDialCode(String countryFlag) {
  switch (countryFlag) {
    case '🇺🇦':
      return '+380';
    case '🇺🇸':
      return '+1';
    default:
      return '+380';
  }
}

String clearFromPhoneMask(String phoneNumber) {
  return '+' + phoneNumber.replaceAll(RegExp(r'\D'), '');
}
