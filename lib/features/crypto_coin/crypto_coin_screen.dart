import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  var coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You mast provide String args');
    // if (args == null) {
    //   log('You must provide args');
    //   return;
    // } else if (args is! String) {
    //   log('You must provide String args');
    //   return;
    // } else {
    coinName = args;
    setState(() {});
    // }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          coinName,
        ),
      ),
    );
  }
}
