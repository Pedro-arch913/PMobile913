import 'package:flutter/material.dart';

class ConfirmPage extends StatelessWidget{
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              shape: BoxShape.circle,
            ),
            child: Icon(
                Icons.check,
                    size: 100,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text('Pedido Concluído!',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),)
        ],
    ),
      ),
    );
  }
}