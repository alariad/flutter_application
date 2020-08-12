import 'package:flutter/material.dart';
import '../shared/decoration.dart';
import 'screens.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  String error = '';
// text field state
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image(
                image: AssetImage('assets/flutter.png'),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 60.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Username', icon: Icon(Icons.person)),
                        validator: (val) => val.isEmpty ? 'Username is invalid' : null,
                        onChanged: (val) {
                          setState(() => username = val);
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Email', icon: Icon(Icons.mail)),
                        validator: (val) =>
                        !(val.contains('@')) && val.isEmpty ? 'Email is invalid' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(hintText: 'Password', icon: Icon(Icons.lock)),
                        validator: (val) => val.length  < 6 && val.isEmpty
                            ? 'Pasword is short (minimum is 6 characters)'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                    child: RaisedButton(
                        elevation: 12,
                        child: Container(
                          height:34,
                          width:280,
                          child: Center(
                            child: Text (
                              'Sign Up',
                              style: TextStyle (color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.grey),
                        ),
                      onPressed:  (){ Navigator.push(
                                  context, MaterialPageRoute(
                                  builder: (context) => Home()
                              )
                              );}
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? ',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 17)),
                  GestureDetector(
                    onTap: () => {Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => SignIn()
                    )
                    )},
                    child: Container(
                      child: Text('Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontSize: 17)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );

  }
}
