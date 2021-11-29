import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{

  void initState(){
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
            ),
            Image.asset(
              'assets/images/logoUnair.png',
              height: 200,
              width: 200,
            ),
            Container(
              height: 10,
            ),
            Text("Belajar Flutter",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0
              ),
            )
          ],
        ),
      );
  }
}

class MyHomePage extends StatelessWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 200,
            width: 200,
          ),
          Container(
            height: 10,
          ),
          Text(
            'New Experience',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Container(
            height: 10,

          ),
          Container(
            margin: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
            child: Text(
              'Watch a new movie much easier than any before',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 75,
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context){
                        return SignUp();
                      }
                  )
              );
            },
            color: Colors.purple,
            child: Text(
                'Get Started',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Already have an account? '),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context){
                            return SignIn();
                          }
                      )
                  );
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.purple
                  ),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}

class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _SignUp();
  }
}
class _SignUp extends State<SignUp>{
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _nama = TextEditingController();
  final user = User(nama: '', email: '', password: '');
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formkey,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, size: 30,)
              ),
              Container(
                width: 100,
              ),
              Container(
                width: 125,
                  child: Text(
                    'Create New Account',
                    style: TextStyle(
                        fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  )
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              Icon(
                Icons.account_circle,
                color: Colors.yellow,
                size: 100,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 80, 0, 0),
                child: Icon(
                  Icons.add_circle,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: _nama,
                validator: RequiredValidator(errorText: "Tidak Boleh Kosong!"),
                decoration: InputDecoration(
                    hintText: 'Full Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
            )
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: _email,
                validator: MultiValidator([
                  EmailValidator(errorText: "Format Email Salah"),
                  RequiredValidator(errorText: "Tidak Boleh Kosong!")
                ]),
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              )
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: _password,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Tidak Boleh Kosong!"),
                  MinLengthValidator(6, errorText: "Min Length 6 Char!")
                ]),
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              )
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: _confirmPass,
                validator: (val){
                  if(val!.isEmpty){
                    return "Harus Diisi!";
                  }
                  return MatchValidator(errorText: "Password Tidak Sama").validateMatch(val, _password.text);
                },
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 50,
            width: 50,
            child: RaisedButton(
              onPressed: (){
                user.nama = _nama.text;
                user.email = _email.text;
                user.password = _confirmPass.text;
                if(formkey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ProsesLogin(user: user);
                          }
                      )
                  );
                }
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              color: Colors.purple,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )
          )
          ]
    )
    );
  }
}

class SignIn extends StatelessWidget{
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 100,
            ),
          ),
          Container(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 200,
            child: Text(
              'Welcome Back Explorer!',
              style: TextStyle(
                fontSize: 30
              ),
            ),
          ),
          Container(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.all(10),
              child: TextFormField(
                validator: RequiredValidator(errorText: "Tidak Boleh Kosong!"),
                decoration: InputDecoration(
                  hintText: 'Email', 
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              )
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                validator: RequiredValidator(errorText: "Tidak Boleh Kosong"),
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              )
          ),
          Row(
            children: <Widget>[
              Container(
                width: 10,
              ),
              Text('Forgot Password? '),
              Text(
                'Get Now',
                style: TextStyle(
                    color: Colors.purple
                ),
              )
            ],
          ),
          Container(
            height: 25,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 175,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                width: 50,
                child: RaisedButton(
                  onPressed: (){},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                  color: Colors.grey,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 25,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 10,
              ),
              Text('Start From Now? '),
              GestureDetector(
                onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) {
                              return SignUp();
                            }
                        )
                    );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.purple
                  ),
                ),
              )
            ],
          )
        ],
      ),
    )
    ]
    )
    );
  }
}

class Choice extends StatefulWidget{
  final User user;
  final List<String> genres = [
    "Horror",
    "Music",
    "Action",
    "Drama",
    "War",
    "Crime"
  ];
  final List<String> languages = ["Bahasa", "English", "Japanese", "Korean"];
  Choice({Key? key, required this.user}) : super(key: key);

  _Choice createState() => _Choice(user: this.user);
}

class _Choice extends State<Choice>{
  User user;
  List<String> selectedGenre = [];
  String selectedLanguage = "English";
  _Choice({required this.user});
  Color alert= Colors.transparent;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 160,
                  child: Text(
                    'Select Your Four Favorite Genres',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: generateBoxGenre(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 160,
                  child: Text(
                    'Movie Language You Prefer?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: generateBoxLanguage(),
              ),
            ),
            FloatingActionButton(
                child: Icon(Icons.arrow_forward),
                backgroundColor: Colors.purple,
                elevation: 0,
                onPressed: () {
                  if (selectedGenre.length == 4) {
                    Preferensi pref = Preferensi(
                        genre: selectedGenre,
                        language: selectedLanguage
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Nextpage(pref: pref, user: user)
                        )
                    );
                  } else {
                    setState(() {
                      this.alert = Colors.red;
                    });
                  }
                }
            ),
            Text(
              "Pilih 4 Genre Terlebih Dahulu",
              style: TextStyle(
                color: this.alert
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      )
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //     Container(
      //       height: 50,
      //     ),
      //     Row(
      //       children: <Widget>[
      //         Container(
      //           width: 10,
      //         ),
      //         GestureDetector(
      //             onTap: () {
      //               Navigator.pop(context);
      //             },
      //             child: Icon(Icons.arrow_back, size: 30,)
      //         ),
      //       ],
      //     ),
      //     Container(
      //       height: 25,
      //     ),
      //     Container(
      //       margin: EdgeInsets.only(left: 10),
      //       width: 200,
      //       child: Text(
      //         'Select Your Favorite Genres',
      //         style: TextStyle(
      //           fontSize: 20
      //         ),
      //       ),
      //     ),
      //     Container(
      //       height: 25,
      //     ),
      //     Row(
      //       children: <Widget>[
      //         Spacer(),
      //         GestureDetector(
      //           child: Container(
      //               decoration: BoxDecoration(color: this.horror,borderRadius: BorderRadius.all(Radius.circular(5)),
      //                   border: Border.all()
      //               ),
      //               width: 150,
      //               height: 50,
      //               child: Center(
      //                 child: Text(
      //                   'Horor',
      //                   style: TextStyle(
      //                       fontSize: 15
      //                   ),
      //                 ),
      //               )
      //           ),
      //           onTap: (){Horror();},
      //         ),
      //         Spacer(),
      //         GestureDetector(
      //           child: Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.all(Radius.circular(5)),
      //                 border: Border.all(),
      //                 color: this.music,
      //               ),
      //               width: 150,
      //               height: 50,
      //               child: Center(
      //                 child: Text(
      //                   'Music',
      //                   style: TextStyle(
      //                       fontSize: 15
      //                   ),
      //                 ),
      //               )
      //           ),
      //           onTap: (){Music();},
      //         ),
      //         Spacer(),
      //       ],
      //     ),
      //     Container(
      //       height: 25,
      //     ),
      //     Row(
      //       children: <Widget>[
      //         Spacer(),
      //         GestureDetector(
      //           child: Container(
      //               decoration: BoxDecoration(color: this.action,borderRadius: BorderRadius.all(Radius.circular(5)),
      //                   border: Border.all()
      //               ),
      //               width: 150,
      //               height: 50,
      //               child: Center(
      //                 child: Text(
      //                   'Action',
      //                   style: TextStyle(
      //                       fontSize: 15
      //                   ),
      //                 ),
      //               )
      //           ),
      //           onTap: (){Action();},
      //         ),
      //         Spacer(),
      //         GestureDetector(
      //           child: Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.all(Radius.circular(5)),
      //                 border: Border.all(),
      //                 color: this.drama,
      //               ),
      //               width: 150,
      //               height: 50,
      //               child: Center(
      //                 child: Text(
      //                   'Drama',
      //                   style: TextStyle(
      //                       fontSize: 15
      //                   ),
      //                 ),
      //               )
      //           ),
      //           onTap: (){Drama();},
      //         ),
      //         Spacer(),
      //       ],
      //     ),
      //     Container(
      //       height: 25,
      //     ),
      //     Row(
      //       children: <Widget>[
      //         Spacer(),
      //         GestureDetector(
      //           child: Container(
      //               decoration: BoxDecoration(color: this.war,borderRadius: BorderRadius.all(Radius.circular(5)),
      //                   border: Border.all()
      //               ),
      //               width: 150,
      //               height: 50,
      //               child: Center(
      //                 child: Text(
      //                   'War',
      //                   style: TextStyle(
      //                       fontSize: 15
      //                   ),
      //                 ),
      //               )
      //           ),
      //           onTap: (){War();},
      //         ),
      //         Spacer(),
      //         GestureDetector(
      //           child: Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.all(Radius.circular(5)),
      //                 border: Border.all(),
      //                 color: this.crime,
      //               ),
      //               width: 150,
      //               height: 50,
      //               child: Center(
      //                 child: Text(
      //                   'Crime',
      //                   style: TextStyle(
      //                       fontSize: 15
      //                   ),
      //                 ),
      //               )
      //           ),
      //           onTap: (){Crime();},
      //         ),
      //         Spacer(),
      //       ],
      //     ),
      //     Container(
      //       height: 25,
      //     ),
      //     Container(
      //       margin: EdgeInsets.only(left: 10),
      //       width: 200,
      //       child: Text(
      //         'Movie Language You Prefer?',
      //         style: TextStyle(
      //             fontSize: 20
      //         ),
      //       ),
      //     ),
      //     Container(
      //       height: 25,
      //     ),
      //     Row(
      //       children: <Widget>[
      //         Spacer(),
      //         GestureDetector(
      //           child: Container(
      //               decoration: BoxDecoration(color: this.bahasa,borderRadius: BorderRadius.all(Radius.circular(5)),
      //                   border: Border.all()
      //               ),
      //               width: 150,
      //               height: 50,
      //               child: Center(
      //                 child: Text(
      //                   'Bahasa',
      //                   style: TextStyle(
      //                       fontSize: 15
      //                   ),
      //                 ),
      //               )
      //           ),
      //           onTap: (){Bahasa();},
      //         ),
      //         Spacer(),
      //         GestureDetector(
      //           child: Container(
      //               decoration: BoxDecoration(
      //                 color: this.english,
      //                 borderRadius: BorderRadius.all(Radius.circular(5)),
      //                 border: Border.all(),
      //               ),
      //               width: 150,
      //               height: 50,
      //               child: Center(
      //                 child: Text(
      //                   'English',
      //                   style: TextStyle(
      //                       fontSize: 15
      //                   ),
      //                 ),
      //               )
      //           ),
      //           onTap: (){English();},
      //         ),
      //         Spacer(),
      //       ],
      //     ),
      //     Container(
      //       height: 25,
      //     ),
      //     Row(
      //       children: <Widget>[
      //         Spacer(),
      //         GestureDetector(
      //           child: Container(
      //               decoration: BoxDecoration(color: this.japanese, borderRadius: BorderRadius.all(Radius.circular(5)),
      //                   border: Border.all()
      //               ),
      //               width: 150,
      //               height: 50,
      //               child: Center(
      //                 child: Text(
      //                   'Japanese',
      //                   style: TextStyle(
      //                       fontSize: 15
      //                   ),
      //                 ),
      //               )
      //           ),
      //           onTap: (){Japanese();},
      //         ),
      //         Spacer(),
      //         GestureDetector(
      //           child: Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.all(Radius.circular(5)),
      //                 border: Border.all(),
      //                 color: this.korean
      //               ),
      //               width: 150,
      //               height: 50,
      //               child: Center(
      //                 child: Text(
      //                   'Korean',
      //                   style: TextStyle(
      //                       fontSize: 15
      //                   ),
      //                 ),
      //               )
      //           ),
      //           onTap: (){Korean();},
      //         ),
      //         Spacer(),
      //       ],
      //     ),
      //     Container(
      //       height: 25,
      //     ),
      //     Container(
      //       margin: EdgeInsets.only(left: 175),
      //       height: 50,
      //       width: 50,
      //       child: RaisedButton(
      //         onPressed: (){},
      //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      //         color: Colors.purple,
      //         child: Icon(
      //           Icons.arrow_forward,
      //           color: Colors.white,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
  List<Widget> generateBoxLanguage(){
    double mywidth = (MediaQuery.of(context).size.width - 60) / 2;

    return widget.languages.map(
            (lang) => Selectablebox(
          lang,
          width: mywidth,
          isSelected: selectedLanguage == lang,
          onTap: (){
            onSelectLanguage(lang);
          },
        )
    ).toList();
  }

  void onSelectLanguage(String lang){
    setState((){
      selectedLanguage = lang;
    });
  }

  List<Widget> generateBoxGenre(){
    double mywidth = (MediaQuery.of(context).size.width - 60) / 2;

    return widget.genres.map(
            (genre) => Selectablebox(
          genre,
          width: mywidth,
          isSelected: selectedGenre.contains(genre),
          onTap: (){
            onSelectGenre(genre);
          },
        )
    ).toList();
  }

  void onSelectGenre(String genre){
    if(selectedGenre.contains(genre)){
      setState((){
        selectedGenre.remove(genre);
      });
    } else {
      if(selectedGenre.length < 4){
        setState((){
          selectedGenre.add(genre);
        });
      }
    }
  }
}

class User {
  String nama;
  String email;
  String password;

  User({required this.nama, required this.email, required this.password});
}

class ProsesLogin extends StatelessWidget{
  final User user;

  ProsesLogin({required this.user});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(user.nama),
          Text(user.email),
          Text(user.password),
          FloatingActionButton(
            child: Icon(Icons.arrow_forward),
              backgroundColor: Colors.purple,
              elevation: 0,
              onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>Choice(user: this.user,))
              );
              }
          )
        ],
      ),
    );
  }
}

class Selectablebox extends StatelessWidget{
  final bool isSelected;
  final double width;
  final double height;
  final String text;
  final Function? onTap;

  Selectablebox(this.text,
  {this.isSelected = false,
  this.width = 144,
  this.height = 60,
  this.onTap});

  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        if(onTap != null){
          onTap!();
        }
      },
      child: Container(
        width: width,
        height: height,
        child: Center(
          child: Text(text),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black
          ),
          color: (!isSelected) ? Colors.transparent : Colors.yellow
        ),
      ),
    );
  }
}

class Preferensi{
  List<String> genre;
  String language;

  Preferensi({required this.genre, required this.language});
}

class Nextpage extends StatelessWidget{
  final User user;
  final Preferensi pref;

  Nextpage({required this.user, required this.pref});

  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Text(user.nama),
          Text(user.email),
          Text(pref.language),
          Column(
            children: textGenre(),
          )
        ],
      ),
    );
  }
  List<Widget> textGenre(){
    List<Widget> widget = [];
    pref.genre.forEach((element) {widget.add(Text(element));});
    return widget;
  }
}