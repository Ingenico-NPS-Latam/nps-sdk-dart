import 'package:flutter/material.dart';
import 'package:nps_sdk/nps_sdk.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Text Controllers
  TextEditingController _nameController;
  TextEditingController _cardController;
  TextEditingController _cvvController;
  TextEditingController _expController;
  
  //Text Variables 
  String _introText = "In this demo the user has chosen to pay with credit card so the payment form has been displayed";
  String _name = "Jhon Smith";
  String _card = "4507990000000010";
  String _cvv = "123";
  String _expDate = "1912";
  String _responseMsg = "";

  @override
  void initState() {
    //Carga la infomacion cuando se abre la aplicacion
    super.initState();
    _nameController = new TextEditingController(text: _name);
    _cardController = new TextEditingController(text: _card);
    _cvvController = new TextEditingController(text: _cvv);
    _expController = new TextEditingController(text: _expDate);
  }

  _createPaymentMethodToken() async {
    Nps nps = new Nps(sandbox);

    Map createPaymentMethodTokenParams = {
      "psp_Version": "2.2",
      "psp_MerchantId": "sdk_test",
      "psp_CardInputDetails": {
        "HolderName": _nameController.text,
        "Number": _cardController.text,
        "SecurityCode": _cvvController.text,
        "ExpirationDate": _expController.text
      },
      "psp_ClientSession": "YOUR_CLIENT_SESSION"
    }; 

    var response = await nps.createPaymentMethodToken(nps, createPaymentMethodTokenParams);

    setState(() {
      _responseMsg = response["psp_ResponseMsg"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Container(
        child: ListView(
          children: <Widget>[
            new Text(_introText),
            new Container(
              margin: new EdgeInsets.only(left: 120.0, right: 120.0, top: 5.0,),
              child:  new TextField(
                controller: _nameController,
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(left: 120.0, right: 120.0),
              child:  new TextField(
                controller: _cardController,
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(left: 120.0, right: 120.0),
              child:  new TextField(
                controller: _cvvController,
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(left: 120.0, right: 120.0),
              child:  new TextField(
                controller: _expController,
              ),
            ),
            new Container(
              margin: new EdgeInsets.all(15.0),
                child: new Text(_responseMsg, textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),), 
            ),
            new Container(
              margin: new EdgeInsets.only(left: 150.0, right: 150.0),
              child: new RaisedButton(
                child: new Text("SEND"),
                onPressed: _createPaymentMethodToken
              ), 
            )
          ],
        ),
      ),
      
    );
  }
}


/*
new ListView(
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(top: 90.0),
            child: Text("Estado del request:", style: _titleStyle, textAlign: TextAlign.center,),
          ),
          new Container(
            margin: _textMargin,
            child: Text(_responseMsg, style: _textStyle, textAlign: TextAlign.center,),
          ),
          new Container(
            margin: new EdgeInsets.only(top: 40.0),
            child: Text(_tokenLiteral, style: _titleStyle, textAlign: TextAlign.center,),
          ),
          new Container(
            margin: _textMargin,
            child: Text(_token, style: _textStyle, textAlign: TextAlign.center,),
          ),
          new Container(
            margin: EdgeInsets.only(top: 120.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(top: 10.0),
                  child: new RaisedButton(
                    child: new Text("Create Payment Method Token"),
                    color: Colors.greenAccent,
                    onPressed: _createPaymentMethodToken
                  ) ,
                )
              ],
            )
          )
        ],
      )
*/