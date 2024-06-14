import 'package:flutter/material.dart';

class HerMessage extends StatelessWidget {

  const HerMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,  
            borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Saludos!', style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 5),
          _Image(),
        const SizedBox(height: 20)
      ],
    );
  }

}

class _Image extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    print(size);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network('https://yesno.wtf/assets/yes/5-64c2804cc48057b94fd0b3eaf323d92c.gif',
      width : size.width * 0.5,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: size.width * 0.5,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text('Recibiendo imagen...')
        );
      },
      )
    );
  }

}