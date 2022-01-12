import 'package:flutter/material.dart';

class BotaoAnimado extends StatelessWidget {

  final AnimationController controller;
  final Animation<double> largura;
  final Animation<double> opacidade;
  final Animation<double> altura;
  final Animation<double> radius;

  BotaoAnimado({Key? key, required this.controller})
      : largura = Tween<double>(
      begin: 0,
      end: 500
      ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.5, 1
      )
  )),
        altura = Tween<double>(
      begin: 0,
      end: 50
      ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.5, 0.7
      )
  )),
        radius = Tween<double>(
      begin: 0,
      end: 20
      ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(
        0.6, 1
      )
  )),
        opacidade = Tween<double>(
            begin: 0,
            end: 1
        ).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(
                0.6, 0.8
            )
        )),super(key: key);

  Widget _buildAnimation(BuildContext context, Widget? widget){

  return InkWell(
  onTap: (){

  },
  child: Container(
    height: altura.value,
    width: largura.value,
    child: Center(
      child: FadeTransition(
          opacity: opacidade,
              child: const Text("Entrar", style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold
      ),),
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius.value),
      gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 100, 127, 1),
            Color.fromRGBO(255, 123, 147, 1),
          ]
      ),
    ),
  ),
);
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
        animation: controller,
        builder: _buildAnimation,
    );
  }
}