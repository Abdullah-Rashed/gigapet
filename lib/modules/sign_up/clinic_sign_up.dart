import 'package:flutter/material.dart';
import 'package:gigapet/layout/gigapet/gigapet_layout.dart';
import 'package:gigapet/shared/components/components.dart';

class ClinicSignUpScreen extends StatefulWidget {
  const ClinicSignUpScreen({ Key? key }) : super(key: key);

  @override
  _ClinicSignUpScreenState createState() => _ClinicSignUpScreenState();
}

class _ClinicSignUpScreenState extends State<ClinicSignUpScreen> {

  bool isPassword = true;
  bool isPasswordConfirm = true;
  var formKey = GlobalKey<FormState>();
  var passWordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var clinicWorkHoursFromController = TextEditingController();
  var clinicWorkHoursToController = TextEditingController();
  var clinicAddressController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
                const Text(
                  'Gigapet',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(height: 20,),
                  defaultFormField(
                    label: 'First Name',
                    validator: (value){
                      if(value!.isEmpty){
                        return 'First Name Must Not Be Empty';
                      }
                    }
                  ),
                  const SizedBox(height: 20),
      
                   defaultFormField(
                    label: 'Last Name',
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Last Name Must Not Be Empty';
                      }
                    }
                  ),
                  const SizedBox(height: 20),
                  defaultFormField(
                    hintText: 'This will be used when you sign in..',
                    keyboardtype: TextInputType.emailAddress,
                    label: 'Email Address',
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Email Must Not Be Empty';
                      }
                    }
                  ),
                  const SizedBox(height: 20),
                  defaultFormField(
                    hintText: 'Your clinic name in the app..',
                    label: 'Username',
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Username Must Not Be Empty';
                      }
                    }
                  ),
                  const SizedBox(height: 20),
                   defaultFormField(
                     validator: (value){
                      if(value!.isEmpty){
                        return 'Password Must Not Be Empty';
                      }
                    },
                    controller: passWordController,
                    label: 'Password',
                    keyboardtype: TextInputType.visiblePassword,
                    isPassowrd: isPassword,
                    icon: isPassword? Icons.visibility : Icons.visibility_off,
                    iconPressed: (){
                      setState(() {
                        isPassword = !isPassword;
                      });
                    }
                  ),
                  const SizedBox(height: 20), 
                  defaultFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Confirm Your Password';
                      } else if (passWordController.text != confirmPasswordController.text){
                        return 'Passwords do not match';
                      }
                    },
                    controller: confirmPasswordController,
                    keyboardtype: TextInputType.visiblePassword,
                    label: 'Confirm Password',
                    isPassowrd: isPasswordConfirm,
                    icon: isPasswordConfirm? Icons.visibility : Icons.visibility_off,
                    iconPressed: (){
                      setState(() {
                        isPasswordConfirm = !isPasswordConfirm;
                      });
                    }
                  ),
                  SizedBox(height: 20,),
                  defaultFormField(
                    controller: clinicWorkHoursFromController,
                      label: 'Work Hours From',
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Work Hours Must Not Be Empty';
                        }
                      },
                      onTap: (){
                        showTimePicker(
                          context: context, 
                          initialTime: TimeOfDay.now()
                          
                        ).then((value) {
                          clinicWorkHoursFromController.text = value.toString();
                        });
                      }
                      
                  ),
                  const SizedBox(height: 20),
                  defaultFormField(
                      label: 'Work Hours To',
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Work Hours Must Not Be Empty';
                        }
                      },
                      onTap: (){
                        showTimePicker(
                          context: context, 
                          initialTime: TimeOfDay.now()
                        ).then((value) {
                          clinicWorkHoursToController.text = value.toString();
                        });
                      }
                  ),
                  const SizedBox(height: 20),
                  defaultFormField(
                    controller: clinicAddressController,
                      label: 'Clinic Address',
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Address Must Not Be Empty';
                        }
                      }
                  ),
                  const SizedBox(height: 20),
      
                  defaultButton(
                    text: 'SIGN UP',
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => const GigaPetLayout()
                          )
                        );
                      }
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}