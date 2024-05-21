import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:esewa_payment/constant/esewa.dart';
import 'package:flutter/material.dart';

class Esewa {
  pay(BuildContext context) {
    // test purpose change in production
    try {
      EsewaFlutterSdk.initPayment(
        // production use Env.live and key of user
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: kClientId,
          secretId: kSecretKey,
        ),
        esewaPayment: EsewaPayment(
          productId: "1d71jd81",
          productName: "Product One",
          productPrice: "20",
          // what is callBAc?
          callbackUrl: '',
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult paymentResult) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Success")));
        },
        onPaymentFailure: (data) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Failed")));
        },
        onPaymentCancellation: (data) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Cancelled")));
        },
      );
    } catch (e) {
      debugPrint("Exp: $e");
    }
  }

  // verify transaction
  void verifyTransactionStatus(EsewaPaymentSuccessResult result) async {
    /// todo: something
    // verify
  }
}
