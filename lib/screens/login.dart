import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ragini_infosys/widgets/submit_and_verify_button.dart';
import 'package:ragini_infosys/widgets/join_us.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  static final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50.0, bottom: 75.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                  children: const [
                    Text(
                      "We're thrilled to have you back!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Let's get you signed in.",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textField(context),
                    const Text("Forgot password"),
                    const SubmitAndVerifyButton(name: "Submit"),
                    const Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    const JoinUs(),
                  ],
                ),
              ),
              const Text(
                "GUEST",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Neumorphic(
        style: NeumorphicStyle(
            color: Colors.white,
            depth: NeumorphicTheme.embossDepth(context),
            boxShape: const NeumorphicBoxShape.stadium(),
            intensity: 10.0,
            lightSource: LightSource.topLeft),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: "Enter Mobile Number",
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
          controller: usernameController,
        ),
      ),
    );
  }
}
