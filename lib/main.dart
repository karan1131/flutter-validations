import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Login Form UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate(){
    if(formkey.currentState.validate()){
      print("Validated");
    }else{
      print("Not validated");
    }
  }

  String validatePass(value){
    if(value.isEmpty){
      return "Required";
    }else if(value.length < 8) {
      return "Must be atleast 8 characters";
    }else if (value.length > 15){
      return "Must be less than 15 characters";
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          25.0
        ),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email"
                  ),
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: "Required"),
                      EmailValidator(errorText: "Not a valid Email"),
                    ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password"
                    ),
                    validator: validatePass,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: RaisedButton(
                    onPressed: validate,
                    child: Text("LOG IN"),
                  ),
                ),
              ],
            ),
            ),
          ),
      ),
    );
  }
}
