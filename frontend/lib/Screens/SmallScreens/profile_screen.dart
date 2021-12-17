import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:food_app/Widgets/appbar_widget.dart';
import 'package:food_app/Widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const roteName = '/ProfileScreene';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar_widget('my contact info'), body: ProfileWidget());
  }
}
