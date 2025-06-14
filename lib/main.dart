import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  var result="";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 200,
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
            SizedBox(height: 20,),
            TextField(controller: ftcontroller,
              decoration: InputDecoration(
                label: Text("Enter your height feet"),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,),
              SizedBox(height: 20,),
              TextField(decoration: InputDecoration(
                label: Text("Enter your height in inch"),
                prefixIcon: Icon(Icons.height_rounded),


              ),keyboardType:TextInputType.number,
                controller: incontroller,),
              SizedBox(height: 20,),
              OutlinedButton(onPressed: (){

                var wt=wtcontroller.text.toString();
                var ft=ftcontroller.text.toString();
                var inch=incontroller.text.toString();

                if(wt!="" && ft!="" && inch!=""){

                  var iwt=int.parse(wt);
                  var ift=int.parse(ft);
                  var iinch=int.parse(inch);

                  var tInch=(ift*12)+iinch;
                  var tCm=tInch*2.54;
                  var tM=tCm/100;
                  var bmi=iwt/(tM*tM);

                  setState(() {
                    result="Result is ${bmi.toStringAsFixed(2)}";
                  });

                }
                else{
                  print("please fill all the fields");
                  setState(() {
                    result="please fill all the fields";
                  });
                }


              }, child: Text("Calculate now")),
              Text("result: $result", style: TextStyle(fontSize: 44),)
          ],),
        ),
      )
    );
  }
}
