import 'dart:async';
import 'dart:developer';

import 'package:app/core/local_db/shared_prefs_manager.dart';
import 'package:app/feature/onboarding/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feature/tweet/ui/tweets_page.dart';

class DecidePage extends StatefulWidget {
  static StreamController<String?> authStream = StreamController.broadcast();
  const DecidePage({super.key});

  @override
  State<DecidePage> createState() => _DecidePageState();
}

class _DecidePageState extends State<DecidePage> {
  @override
  void initState() {
    getUid();
    super.initState();
  }

  getUid() async {
    String uid = await SharedPreferencesManager.getUid();

    if (uid.isEmpty) {
      DecidePage.authStream.add("");
      log("UId is empty");
    } else {
      log("Uid is $uid");
      DecidePage.authStream.add(uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
        stream: DecidePage.authStream.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return OnboardingScreen();
            }
            return TweetsPage();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            return OnboardingScreen();
          }
        });
  }
}
