
import 'package:flutter/material.dart';

class ert extends StatelessWidget {
  const ert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('xcvbnm'),
        centerTitle:true,
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.abc_outlined),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.access_time))
      ],
    ));

  }
}