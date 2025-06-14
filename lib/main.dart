import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text("BMI", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),

            TextField(controller: wtcontroller,
            decoration: InputDecoration(
              label: Text("Enter your weight"),
              prefixIcon: Icon(Icons.line_weight),
            ),
            keyboardType: TextInputType.number,),
          TextField(controller: wtcontroller,
            decoration: InputDecoration(
              label: Text("Enter your height"),
              prefixIcon: Icon(Icons.height),
            ),
            keyboardType: TextInputType.number,),
            TextField(decoration: InputDecoration(
              label: Text("Enter your height ft"),
              prefixIcon: Icon(Icons.height_rounded),

            ),controller: ftcontroller,),
            OutlinedButton(onPressed: (){}, child: Text("Calculate now"))
        ],),
      )
    );
  }
}
