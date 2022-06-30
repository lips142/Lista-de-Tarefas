import 'package:flutter/material.dart';
import 'package:flutter_application_1/List/toDo_list_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    //depois de 3 segundos carrega a proxima pagina

    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => toDoListPage(),
          ),
        );
      },
    );

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(child: _getLogo()),
            SizedBox(
              height: 35,
              width: 35,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                backgroundColor: Colors.blue,
              ),
            ),
            const Text(
              "Versão 1.0",
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  _getLogo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ("assets/img/background.jpg"),
          height: 200,
          width: 299,
        ),
        Text(
          "Lista De Tarefas",
          style: TextStyle(
            fontSize: 30,
            color: Colors.blue,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
