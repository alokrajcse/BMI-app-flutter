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
      title: 'BMI  Calculator',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(title: 'Rocket BMI Calculator'),
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


  var bgcolor;

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
      body: Container(
        color: bgcolor,
        child: Center(
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


                    var msg="";
                    if(bmi>25){
                      msg="You are overweight";
                      bgcolor=Colors.orange;
                    }
                    else if(bmi<18){
                      msg="You are underweight";
                      bgcolor=Colors.red;
                    }
                    else{
                      msg="You are Healthy";
                      bgcolor=Colors.blue.shade200;
                    }

                    setState(() {
                      result="$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                      // bgcolor=bgcolor;
                    });

                  }
                  else{
                    print("please fill all the fields");
                    setState(() {
                      result="please fill all the fields";
                    });
                  }


                }, child: Text("Calculate now")),
                Text(" result: $result", style: TextStyle(fontSize: 24),)
            ],),
          ),
        ),
      )
    );
  }
}
