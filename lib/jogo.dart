import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {

  const Jogo({super.key});

  @override
  JogoState createState() => JogoState();
}

class JogoState extends State<Jogo> {

  var _imageApp = const AssetImage("imagens/padrao.png");

  var _resultado = "Escolha uma das opções abaixo";

  final _jogadas = ["pedra","papel","tesoura"];

  void verificaJogada(String jogadaUsuario){

    final jogadaGerada = Random().nextInt(_jogadas.length);
    
    final jogadaApp = _jogadas[ jogadaGerada ];

    var msg = "";

    calculaVencedor(jogadaUsuario, jogadaApp) ?
      msg = "Parabens. Você venceu!":
    calculaVencedor(jogadaApp, jogadaUsuario) ?
      msg = "Você perdeu!":
      msg = "Jogo empatou";

    setState(() {
    
      _imageApp = AssetImage("imagens/$jogadaApp.png");

      _resultado = msg;
    });

  }

  bool calculaVencedor (String jogada1, String jogada2){
    return 
      jogada1 == "papel" && jogada2 == "pedra" ||
      jogada1 == "pedra" && jogada2 == "tesoura" ||
      jogada1 == "tesoura" && jogada2 == "papel";
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("JoKenPo"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child:Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top:16, bottom: 16),
                  child: Text(
                  "Escolha do App",
                    style: TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Image(image: _imageApp, height: 90),
                Padding(padding: const EdgeInsets.only(bottom: 16, top: 16),
                  child: Text(
                  _resultado,
                    style: const TextStyle(
                      fontSize:20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => verificaJogada("papel"),
                      child: Image.asset("imagens/papel.png", height: 90),
                    ),
                    GestureDetector(
                      onTap: () => verificaJogada("pedra"),
                      child: Image.asset("imagens/pedra.png", height: 90),
                    ),
                    GestureDetector(
                      onTap: () => verificaJogada("tesoura"),
                      child: Image.asset("imagens/tesoura.png", height: 90),
                    ),
                  ],
                )
              ],
            ),
        )
      ),
    );
  }
}
