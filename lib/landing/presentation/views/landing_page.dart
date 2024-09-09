import 'package:flutter/material.dart';
import 'package:task/login/presentation/views/login_phone.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome To WhatsApp',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/icon.png'),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  ''' Read our privacy and Tap agree and continue
                  to accept our terms
                        
                        ''',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 20,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.greenAccent),
                  fixedSize: WidgetStateProperty.all(
                    const Size(300, 50),
                  )),
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder:
                (context) => const LoginPhone()
                )
                
                );
                
                
              },
              child: const Text(
                'AGREE AND CONTINUE',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
