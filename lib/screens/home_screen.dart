import 'package:flutter/material.dart';

import 'package:pos/screens/deposit/first_deposit.dart';
import 'package:pos/screens/transfer/first_transfer.dart';
import 'package:pos/screens/withdraw/first_withdrawal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalAmount = 0;
  String businessName = '';

  void rebuild() {
    setState(() {});
  }

  getValueOfSharedPreference() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    double amount = _prefs.getDouble('amount') ?? 0;
    String name = _prefs.getString('name') ?? 'Michael';
    totalAmount = amount;
    businessName = name;
    rebuild();
  }

  // ReturnType functionName ( *args ) {
  @override
  Widget build(BuildContext context) {
    getValueOfSharedPreference();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 55, 127),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 68, 117, 156),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 10,
                      color: Colors.black38),
                ],
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '₦$totalAmount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '$businessName\'s POS',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FirstWithdrawal(rebuildHome: rebuild),
                  ),
                );
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 68, 117, 156),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 10,
                        color: Colors.black38),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Withdrawal',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FirstDeposit(
                      rebuildHome: rebuild,
                    ),
                  ),
                );
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 68, 117, 156),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 10,
                        color: Colors.black38),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Deposit',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FirstTransfer(rebuildHome: rebuild))),
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 68, 117, 156),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 10,
                        color: Colors.black38),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Transfer',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () async {
                SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                double amount = _prefs.getDouble('amount') ?? 0;
                return showDialog(
                  context: context,
                  // barrierDismissible: false,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Center(
                        child: Text('Your Account balance is:'),
                      ),
                      children: [
                        Center(
                          child: Text(
                            '₦$amount',
                            style: const TextStyle(
                              fontSize: 60,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 68, 117, 156),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 10,
                        color: Colors.black38),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Balance',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // ElevatedButton.icon(style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 68, 117, 156) ),
          //   onPressed: () async {
          //     Navigator.pop(context);
          //     SharedPreferences _prefs = await SharedPreferences.getInstance();
          //     _prefs.remove('amount');
          //     _prefs.remove('name');
          //   },
          //   icon: const Icon(
          //     Icons.exit_to_app,
          //     color: Colors.white,
          //   ),
          //   label: const Text(
          //     'Exit',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 18,
          //       letterSpacing: 5,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
