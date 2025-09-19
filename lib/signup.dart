import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(builder: (context,constrain){
      if(constrain.maxWidth<650){
        return const Signupmobile();
      }else{
        return const Sigupweb();
      }
    });
  }
}
class Sigupweb extends StatelessWidget{
   const Sigupweb({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: 
        Container(
          
          padding: EdgeInsets.all(10),
          height: double.infinity,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 2,child: Center(child: Text("Singup",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.green),))),
                  Expanded(
                    flex: 8,
                    child: Row(
                      children: [
                        Expanded(child: 
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "images/logofix.png"
                              ),
                              SizedBox(height: 10,),
                              Text('Welcome to Green Aplication')
                            ],
                          )
                        ),
                        Expanded(child: 
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            child: Card(
                              child: Padding(padding: EdgeInsetsGeometry.all(20),child: Formsignup()),
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}

class Signupmobile extends StatelessWidget{
  const Signupmobile({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("images/logofix.png"),
                      SizedBox(height: 10,),
                      Text("Pendaftaran Akun"),
                    ],
                  ),
                ),
              ),
              Expanded( child: SingleChildScrollView(child: Formsignup())),
            ],
          ),
        ),
      ),
    );
  }
}

class Formsignup extends StatefulWidget {
  const Formsignup({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Formsignup();
  }
}

class _Formsignup extends State {
  String? username;
  String? password;
  String? repassword;
  Text? isi;
  bool cek() {
    if (password != repassword || password == null || username == null || repassword ==null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    const spasi = SizedBox(height: 10);

    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            label: Text("username"),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onChanged: (value) => setState(() {
            username = value;
          }),
        ),
        spasi,
        TextField(
          decoration: InputDecoration(
            label: Text("password"),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onChanged: (value) => setState(() {
            password = value;
          }),
        ),
        spasi,
        TextField(
          decoration: InputDecoration(
            label: Text("repassword"),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onChanged: (value) => setState(() {
            repassword = value;
          }),
        ),
        spasi,
        OutlinedButton(
          onPressed: () {
            if (cek()) {
              isi = Text(
                "berhasil mendaftar nama $username password $password",
              );
            } else {
              isi = Text("password dan repassword harus sama");
            }
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: isi);
              },
            );
          },
          child: Text("Daftar"),
        ),
        spasi,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sudah memiliki akun?"),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Login",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green
              ),),
            )
          ],
        )
      ],
    );
  }
}
