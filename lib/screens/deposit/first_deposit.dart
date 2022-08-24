import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FirstDeposit extends StatelessWidget {
  final Function rebuildHome;
  const FirstDeposit({Key? key, required this.rebuildHome}) : super(key: key);

  deposit(
    BuildContext context,
    double amount,
  ) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    double prefBalance = _prefs.getDouble('amount') ?? 0;
    await _prefs.setDouble('amount', prefBalance + amount);
    await _prefs.reload();
    rebuildHome();
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Center(
              child: Text('Deposit successful'),
            ),
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
              Center(child: Text('You just made a deposit of $amount')),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('PRINT'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 5, 55, 127),
        body: Column(children: [
          const Center(
            child: Card(
              elevation: 5,
              color: Color.fromARGB(255, 68, 117, 156),
              shape: RoundedRectangleBorder(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Center(
                  child: Text(
                    'How much do you want to deposit ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              margin: EdgeInsets.only(),
            ),
          ),
          const SizedBox(height: 80),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => deposit(
                context,
                10000,
              ),
              child: const Card(
                elevation: 5,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, right: 80, left: 80),
                  child: Text('10000',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                color: Color.fromARGB(255, 68, 117, 156),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => deposit(
                context,
                20000,
              ),
              child: const Card(
                elevation: 5,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, right: 80, left: 80),
                  child: Text('20000',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                color: Color.fromARGB(255, 68, 117, 156),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Center(
                        child: Text(
                          'How much do you want to deposit',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Builder(builder: (context) {
                            return TextField(
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.send,
                              onSubmitted: (text) async {
                                SharedPreferences _prefs =
                                    await SharedPreferences.getInstance();
                                double prefBalance =
                                    _prefs.getDouble('amount') ?? 0;
                                await _prefs.setDouble(
                                    'amount', prefBalance + double.parse(text));
                                rebuildHome();

                                Navigator.pop(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('SUCCESSFUL'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 1),
                                ));
                              },
                            );
                          }),
                        ),
                      ],
                    );
                  }),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: deviceSize.height * 0.025,
                      bottom: deviceSize.height * 0.025,
                      right: deviceSize.width * 0.25,
                      left: deviceSize.width * 0.25),
                  child: const Text('Other',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                color: const Color.fromARGB(255, 68, 117, 156),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                elevation: 5,
                color: const Color.fromARGB(255, 68, 117, 156),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, right: 80, left: 80),
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
