import 'package:flutter/material.dart';
import 'package:taskmanager_app/api/apiClient.dart';
import 'package:taskmanager_app/style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  Map<String, String> FormValues = {"email":"", "password": ""};
  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }


  FormOnSubmit () async {
    if(FormValues ['email']!.length==0) {
      ErrorToast('Email Required!');
    }

    else if(FormValues['password']!.length==0) {
      ErrorToast('Password Required!');
    }
    else {
      setState(() {
        Loading = true;
      });
      bool res = await LoginRequest(FormValues);

      if (res == true) {
        // navigate to dashboard  page
       Navigator.pushNamedAndRemoveUntil(context, "/newTaskList", (route) => false);
      }

      else {
        setState(() {
          Loading = false;
        });
      }
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: Loading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text("Get Started With", style: Head1Text(colorDarkBlue)),
                    SizedBox(height: 1),
                    Text("Learn with rabbil hasan", style: Head6Text(colorLightGray)),
                    SizedBox(height: 20),
                    TextFormField(
                      onChanged: (Textvalue) {
                        InputOnChange("email", Textvalue);
                      },
                      decoration: AppInputDecoration("Email Address"),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onChanged: (Textvalue) {
                        InputOnChange("password", Textvalue);
                      },
                      decoration: AppInputDecoration("Password"),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: ElevatedButton(
                        style: AppButtonStyle(),
                        child: SuccessButtonChild('Login'),
                        onPressed: () {
                          FormOnSubmit();
                        },
                      ),
                    ),
                    SizedBox(height: 20),


                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, "/emailVerification");
                              },
                              child: Text('Forget Password?',style: Head7Text(colorLightGray),
                              )
                          ),

                          SizedBox(height: 15),

                          InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, "/registration");
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have a account? ",style: Head7Text(colorDarkBlue)),
                                  Text("Sign Up",style: Head7Text(colorGreen),)
                                ],
                              )
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
