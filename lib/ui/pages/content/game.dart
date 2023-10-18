import 'package:flutter/material.dart';

class KeyPad extends StatelessWidget {
  const KeyPad({
    super.key,
    required this.onInputNumber,
    required this.onClearLastInput,
    required this.onClearAll,
    required this.sendInput,
  });

  final ValueSetter<int> onInputNumber;
  final VoidCallback onClearLastInput;
  final VoidCallback onClearAll;
  final VoidCallback sendInput;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 1; i < 4; i++)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int j = 1; j < 4; j++)
                  Expanded(
                    child: Numeral(
                      number: (i - 1) * 3 + j,
                      onKeyPress: () => onInputNumber((i - 1) * 3 + j),
                    ),
                  ),
              ],
            ),
          ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClearButton(
                  onClearLastInput: onClearLastInput,
                  onClearAll: onClearAll,
                ),
              ),
              Expanded(
                  child: Numeral(
                number: 0,
                onKeyPress: () => onInputNumber(0),
              )),
              Expanded(
                child: SendButton(
                  sendInput: sendInput,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Numeral extends StatelessWidget {
  const Numeral({
    super.key,
    required this.number,
    required this.onKeyPress,
  });

  final int number;
  final VoidCallback onKeyPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10), // Puedes ajustar el valor de "0" para controlar la esquina del botón
          ),
        ),
        onPressed: onKeyPress,
        child: Text('$number',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 23, 107, 15),
            )),
      ),
    );
  }
}

class ClearButton extends StatelessWidget {
  const ClearButton({
    super.key,
    required this.onClearLastInput,
    required this.onClearAll,
  });

  final VoidCallback onClearLastInput;
  final VoidCallback onClearAll;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onClearAll,
      child: TextButton(
        onPressed: onClearLastInput,
        style: TextButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 222, 114, 37),
        ),
        child: const Text(
          'CE', // Cambia este texto según tus necesidades
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.sendInput,
  });

  final VoidCallback sendInput;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextButton(
        onPressed: sendInput,
        style: TextButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 46, 37, 222),
        ),
        child: const Text(
          '=', // Cambia este texto según tus necesidades
        ),
      ),
    );
  }
}
