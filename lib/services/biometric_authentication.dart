import 'package:anonymous_love_and_health_chat/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuthentication extends StatefulWidget {
  @override
  _BiometricAuthenticationState createState() =>
      _BiometricAuthenticationState();
}

class _BiometricAuthenticationState extends State<BiometricAuthentication> {
  LocalAuthentication localAuth = LocalAuthentication();
  bool _canCheckBiometric;
  List<BiometricType> _availableBiometric;

  // Check the biometric sensors can use or not
  Future<void> _checkBiometric() async {
    bool canCheckBiometric = await localAuth.canCheckBiometrics;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  // Get available biometric sensors
  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometric =
        await localAuth.getAvailableBiometrics();

    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  // Authentication
  Future<void> _authenticate() async {
    bool authenticated = false;

    authenticated = await localAuth.authenticateWithBiometrics(
        localizedReason: "Authenticate to access app",
        useErrorDialogs: true,
        stickyAuth: false);

    setState(() {
      if (authenticated) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    _checkBiometric();
    _getAvailableBiometrics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF3C3E52),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 24.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.fingerprint,
                      size: 120.0,
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Fingerprint Authentication',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      width: 150.0,
                      child: Text(
                        'Touch ID to Access App',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: _authenticate,
                        elevation: 0.0,
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Text(
                            'Authenticate',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}