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
      margin: const EdgeInsets.all(5),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 69, 127, 253),
          shape: const CircleBorder(),
        ),
        onPressed: onKeyPress,
        child: Text('$number',
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
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
      child: IconButton(
        onPressed: onClearLastInput,
        icon: const Icon(
          Icons.backspace,
          color: Color.fromARGB(255, 255, 49, 49),
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
      child: IconButton(
        onPressed: sendInput,
        icon: const Icon(
          Icons.arrow_circle_right,
          color: Color.fromARGB(255, 30, 255, 10),
        ),
      ),
    );
  }
}
