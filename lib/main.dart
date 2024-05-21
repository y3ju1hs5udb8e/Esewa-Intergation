import 'package:esewa_payment/functions/payment.dart';
import 'package:esewa_payment/vote_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Payment(),
    );
  }
}

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Esewa esewa = Esewa();
                esewa.pay(context);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250, 50),
                backgroundColor: Colors.green.withOpacity(0.7),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Pay',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VotePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(250, 50),
                backgroundColor: Colors.red.withOpacity(0.7),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'View Votes',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _showSnackBar(BuildContext context, String errorMessage) {
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(errorMessage)));
  // }
}
