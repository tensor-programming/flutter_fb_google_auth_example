import 'package:flutter/material.dart';
import 'package:fire_store_example/api.dart';

import 'dart:async';

import 'dart:ui' show ImageFilter;

class LoginPage extends StatelessWidget {
  Future<bool> _loginUser() async {
    final api = await FBApi.signInWithGoogle();
    if (api != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(
                  width: 250.0,
                  height: 250.0,
                ),
                child: Container(
                  color: Colors.cyan[100].withOpacity(0.7),
                ),
              ),
            ),
            Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Container(
                  width: 250.0,
                  height: 250.0,
                  color: Colors.grey[100].withOpacity(0.2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Login to the App!",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      FlatButton(
                        color: Colors.black54,
                        onPressed: () async {
                          bool b = await _loginUser();

                          b
                              ? Navigator.of(context).pushNamed('home-page')
                              : Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Wrong Email!'),
                                    ),
                                  );
                        },
                        textColor: Colors.white.withOpacity(0.5),
                        child: Text('Sign In!'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
