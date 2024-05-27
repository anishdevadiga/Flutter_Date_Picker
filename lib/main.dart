import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        fontFamily: CupertinoIcons.iconFont,

      ),
      home: const MyHomePage(title: 'Date Picker',),
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
  //DateTime? pd;
  TextEditingController datecontrol=TextEditingController();
  Future<void> _selectDate() async
  {
    DateTime? pickedDate=await showDatePicker(context: context,
        initialDate:DateTime.now() ,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
    if(pickedDate !=null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);


      setState(() {
        datecontrol.text = formattedDate;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text(widget.title),

      ),
     body:Padding(
       padding: const EdgeInsets.all(30),
       child: Center(
         child:TextFormField(
           controller: datecontrol,
           decoration: const InputDecoration(
             labelText: 'Select Date',
                 suffixIcon: Icon(Icons.calendar_today_rounded)),
           onTap: _selectDate,
           readOnly: true,

           ),
         ),
     )
     );

  }
}
