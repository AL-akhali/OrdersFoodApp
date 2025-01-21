import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:full_ecommerce/controller/forgetPssword/forgetpassword_controller.dart';
import 'package:get/get.dart';

class Test extends StatefulWidget {
  const Test(String s, {super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("32".tr),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {},
            ),
          ],
        ),
      ),
    );
  }
}
