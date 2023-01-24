import 'package:flutter/material.dart';
import 'package:moviepedia/screen/inputlogin/InputLogin.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(Config.splash_bg), fit: BoxFit.cover)),

        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 600,
            ),
            Text(
              "Let's Cook",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 24, overflow: TextOverflow.fade),
            ),
            Text(
              "Find The Best Recipe",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 24, overflow: TextOverflow.fade),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Inputlogin()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    // backgroundColor: HexColor(ColoR.primary),
                    ),
                child: Text(
                  "Start Cook",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 24, overflow: TextOverflow.fade),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        )),
      ),
    );
  }
}
