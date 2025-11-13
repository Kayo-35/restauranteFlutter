import 'package:flutter/material.dart';

void main() {
  runApp(Exemplo());
}

class Exemplo extends StatelessWidget {
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "A Brave New World!",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.cyanAccent, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          Container(
              height: 200,
              width: 200,
              color: Colors.lightBlue,
              child: Center(
                child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.deepPurple
                ),
              )
          ),
          Text(
            "The Dawn Of A New Age!",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.red, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 100,
            height: 50,
            child: TextButton(
              onPressed: () {
              },
              child: Text('Botão',
                  textDirection: TextDirection.ltr
              ),
            ),
          )
        ],
      ),
    );
  }
}