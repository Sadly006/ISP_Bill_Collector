import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import '../../DB Get & Post/signin_validator.dart';

enum AniProps { width, height, color }


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
    password.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final TimelineTween<AniProps> _tween = TimelineTween<AniProps>()
      ..addScene(
          begin: const Duration(milliseconds: 0),
          end: const Duration(milliseconds: 1000))
          .animate(AniProps.width, tween: Tween(begin: 0.0, end: 200.0))
      ..addScene(
          begin: const Duration(milliseconds: 1000),
          end: const Duration(milliseconds: 1500))
          .animate(AniProps.width, tween: Tween(begin: 200.0, end: 400.0))
      ..addScene(
          begin: Duration.zero,
          duration: const Duration(milliseconds: 2500))
          .animate(AniProps.height, tween: Tween(begin: 0.0, end: 350.0))
      ..addScene(
          begin: Duration.zero,
          duration: const Duration(milliseconds: 1000))
          .animate(AniProps.color,
          tween: ColorTween(begin: Colors.red, end: Colors.blue));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Hello!!'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/back.jpg"),
                  fit: BoxFit.cover)),

          child: Center(
            child: PlayAnimation<TimelineValue<AniProps>>(
              tween: _tween, // Pass in tween
              duration: _tween.duration, // Obtain duration
              builder: (context, child, value) {
                return SizedBox(
                  width: value.get(AniProps.width), // Get animated value
                  height: value.get(AniProps.height),
                  //color: value.get(AniProps.color),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      elevation: 10,
                      color: Colors.white30,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(60, 20, 60, 0),
                              child: Text(
                                "ISP Service Provider",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                              child: TextFormField(
                                controller: email,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Email',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                              child: TextFormField(
                                obscureText: true,
                                controller: password,
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Password',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueAccent,
                                  onSurface: Colors.red,
                                ),
                                onPressed: () {
                                  validator(email, password, context);
                                },
                                child: const Text('Sign In!'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
