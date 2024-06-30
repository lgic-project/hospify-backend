import 'package:flutter/material.dart';
import 'package:frontend_new/UserData.dart';
import "global.dart" as global;
import 'dashboardpage/dashboardpage.dart';
import 'welcomepage/welcomepage.dart';
import "package:http/http.dart" as http;
import "dart:convert";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // Navigate to DashboardPage on successful login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 1.0),
                  Image.asset('assets/image/logo1.png', height: 300.0),
                  SizedBox(height: 15.0),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future getdata() async {
  Uri url = Uri.parse(global.baseUrl + "/login");
  var response = await http.get(url);
  List data = json.decode(response.body);
  if (data == "Fail") return;
  Userdata ud;
  for (var x = 0; x <= data.length; x++) {
    ud = Userdata(
        data[x][0].toString(),
        data[x][1].toString(),
        data[x][2].toString(),
        data[x][3].toString(),
        data[x][4].toString(),
        data[x][5].toString(),
        data[x][6].toString(),
        data[x][7].toString(),
        data[x][8].toString(),
        data[x][9].toString(),
        data[x][10].toString(),
        data[x][11].toString(),
        data[x][12].toString(),
        data[x][13].toString(),
        data[x][14].toString(),
        data[x][15].toString(),
        data[x][16].toString(),
        data[x][17].toString(),
        data[x][18].toString());
    // data[x][19].toString());
    global.ud.add(ud);
  }

  print(global.ud.toString());
}
