import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variable/State untuk mengambil tanggal
  DateTime selectedDateCekin = DateTime.now();
  DateTime selectedDateCekout = DateTime.now();
//  Initial SelectDate FLutter
  Future<Null> _Cekin(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateCekin,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateCekin)
      setState(() {
        selectedDateCekin = picked;
      });
  }




  Future<Null> _Cekout(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateCekout,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateCekout)
      setState(() {
        selectedDateCekout = picked;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [



                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("${selectedDateCekin.toLocal()}".split(' ')[0]),
                    SizedBox(height: 20.0,),
                    RaisedButton(
                      onPressed: () => {
                        _Cekin(context),
                        print(selectedDateCekin.day + selectedDateCekin.month + selectedDateCekin.year )
                      },
                      
                      child: Text('Tanggal Cek-IN'),
                    ),
                  ],
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("${selectedDateCekout.toLocal()}".split(' ')[0]),
                    SizedBox(height: 20.0,),
                    RaisedButton(
                      onPressed: () => {
                        _Cekout(context),
                        print(selectedDateCekout.day + selectedDateCekout.month + selectedDateCekout.year )
                      },
                      
                      child: Text('Tanggal Cek-Out'),
                    ),
                  ],
                ),
              ],
            ),
            Text("jumlah hari : ${selectedDateCekout.difference(selectedDateCekin).inDays}"),
          ],
        ),
      ),
    );
  }
}