import 'package:flutter/material.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    TextEditingController _otpController1 = TextEditingController();
    TextEditingController _otpController2 = TextEditingController();
    TextEditingController _otpController3 = TextEditingController();
    TextEditingController _otpController4 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 47),
            child: Text(
              'OTP verify',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: ListView(
            children: [
              Image.asset(
                'assets/image/enjoy.png',
                height: 300,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    "OTP Sent to",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "+91 $phoneNumber",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildOTPTextField(_otpController1, context),
                    SizedBox(width: 16.0),
                    buildOTPTextField(_otpController2, context),
                    SizedBox(width: 16.0),
                    buildOTPTextField(_otpController3, context),
                    SizedBox(width: 16.0),
                    buildOTPTextField(_otpController4, context),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              GestureDetector(
                onTap: () {
                  _showSuccessDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    height: 50,
                    width: 360,
                    child: const Center(
                      child: Text(
                        "Verify OTP",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Column(
                children: [
                  Text(
                    "By signing up, you agree with our terms",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Text(
                    " and conditions",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOTPTextField(
      TextEditingController controller, BuildContext context) {
    return Container(
      width: 70.0,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 234, 234),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color.fromARGB(255, 184, 182, 182))),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: (text) {
          if (text.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success"),
          content: const Text("Your details have been submitted."),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
