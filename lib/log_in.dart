import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_page/otpPage.dart';

class Log_in extends StatelessWidget {
  Log_in({Key? key}) : super(key: key);

  final TextEditingController phoneNumberController = TextEditingController();

  void _navigateToNextPage(BuildContext context) {
    final phoneNumber = phoneNumberController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OTPPage(phoneNumber: phoneNumber),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: ListView(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/image/enjoy.png',
                  height: 300,
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 234, 234),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "+91",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.arrow_drop_down),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: phoneNumberController,
                        decoration: const InputDecoration(
                          hintText: "Phone Number",
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                          PhoneNumberFormatter(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            GestureDetector(
              onTap: () {
                _navigateToNextPage(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 50,
                  width: 340,
                  child: const Center(
                    child: Text(
                      "Get OTP",
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
            )
          ],
        ),
      ),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 5 && oldValue.text.length < 5) {
      return TextEditingValue(
        text: '${newValue.text} ',
        selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
      );
    }
    return newValue;
  }
}
