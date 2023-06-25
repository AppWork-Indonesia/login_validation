import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool passwordToggle = true;
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/avatar.jpg'),
                radius: 50,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: emailC,
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)),
                validator: (value) {
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  if (value.isEmpty) {
                    return "Masukkan Email";
                  } else if (!emailValid) {
                    return "Masukkan Format Email yang Valid";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passC,
                obscureText: passwordToggle,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(passwordToggle
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      passwordToggle = !passwordToggle;
                      setState(() {});
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Masukkan Password";
                  } else if (value!.length < 8) {
                    return "Password Tidak Boleh Kurang Dari 8 Karakter";
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      emailC.clear();
                      passC.clear();
                      print("Login sukses");
                    }
                  },
                  child: Text("Log In"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
