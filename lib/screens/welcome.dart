import 'package:flutter/material.dart';
import 'package:pos/logic/register.dart';
import 'package:pos/screens/home_screen.dart';

// ignore: must_be_immutable
class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 55, 127),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('WELCOME'),
              TextField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                decoration:
                    const InputDecoration(labelText: 'What is your name?'),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Put in a password',),
                    obscureText: true,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                      onPressed: () async {
                        bool result = await BusinessLogic.register(
                            nameController.text);
                        if (result) {
                          //proceed to next page

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Something went wrong'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 1),
                          ));
                        }
                      },
                      child: const Text('Proceed')))
            ],
          ),
        ),
      ),
    );
  }
}
