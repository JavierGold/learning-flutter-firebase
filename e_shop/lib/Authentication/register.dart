import 'dart:io';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:e_shop/DialogBox/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Store/storehome.dart';
import 'package:e_shop/Config/config.dart';



class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

final TextEditingController _nameTextEditingController = TextEditingController();
final TextEditingController _emailTextEditingController = TextEditingController();
final TextEditingController _passwordTextEditingController = TextEditingController();
final TextEditingController _cPasswordTextEditingController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String userImageUrl = "";
File _imageFile;




class _RegisterState extends State<Register>
{
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width, _screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 10,),
            InkWell(
              onTap: ()=>print("selected"),
              child: CircleAvatar(
                radius: _screenWidth * 0.15,
                backgroundColor:Colors.white38,
                backgroundImage: _imageFile==null ? null: FileImage(_imageFile),
                child: _imageFile == null ? Icon(Icons.add_photo_alternate,size: _screenWidth * 0.15,color: Colors.grey,
                ):null,
              ),
            ),
            SizedBox(height: 8.0,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _nameTextEditingController,
                    data: Icons.person,
                    hintText: "Nombre",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _emailTextEditingController,
                    data: Icons.email,
                    hintText: "Correo",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _passwordTextEditingController,
                    data: Icons.email,
                    hintText: "Contraseña",
                    isObsecure: true,
                  ),
                  CustomTextField(
                    controller: _cPasswordTextEditingController,
                    data: Icons.email,
                    hintText: "Confirma contraseña",
                    isObsecure: true,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: ()=>("clicked"),
              child: Text("Inicia Sesión",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 4.0,
              width: _screenWidth * 0.8,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}

