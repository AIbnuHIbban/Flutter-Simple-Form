import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'Form',
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _jk = "";
  
  List<String> agama = ["islam","kristen","hindu","budha"];
  String _agama = "islam";

  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerAlamat = TextEditingController();


  void  _pilihJk(String value){
    setState(() {
      _jk = value;
    });
  }

  void _pilhAgama(value){
    setState(() {
      _agama = value;
    });
  }

  void kirimData(){
    AlertDialog alertDialog = new AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          children: <Widget>[
            new Text("Nama Lengkap : ${controllerNama.text}"),
            new Text("Password : ${controllerPass.text}"),
            new Text("Alamat : ${controllerAlamat.text}"),
            new Text("Jenis Kelamin : $_jk"),
            new Text("Nama Lengkap : $_agama"),
            new RaisedButton(
              child: Text("Ok"),
              onPressed: ()=> Navigator.pop(context)
            )
          ],
        ),
      ),
    );
    showDialog(
      context: context,
      child: alertDialog
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form"),),

      body: ListView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(10),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top:10),),
                new TextField(
                  controller: controllerPass,
                  obscureText: true,
                  decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top:10),),
                new TextField(
                  controller: controllerAlamat,
                  maxLines: 3,
                  decoration: new InputDecoration(
                    hintText: "Alamat",
                    labelText: "Alamat",
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top:10),),
                new RadioListTile(
                  value: "Laki - laki",
                  title: new Text("Laki - laki"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.red,
                  subtitle: new Text("Pilih Laki - laki"),
                ),
                new RadioListTile(
                  value: "Perempuan",
                  title: new Text("Perempuan"),
                  groupValue: _jk,
                  onChanged: (String value){
                    _pilihJk(value);
                  },
                  activeColor: Colors.red,
                  subtitle: new Text("Pilih Perempuan"),
                ),

                new Padding(padding: EdgeInsets.only(top:10),),
                new Container(
                  width: 300,
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: new DropdownButton(
                        value: _agama,
                        items: agama.map((String value){
                          return new DropdownMenuItem(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(), 
                        onChanged: (String value) {
                          _pilhAgama(value);
                        },
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                  ),
                ),

                new RaisedButton(
                  child: new Text("OK"),
                  onPressed: (){
                    kirimData();
                  },

                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}