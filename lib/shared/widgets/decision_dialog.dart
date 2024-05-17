import 'package:eyr/localised/localiser.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DecisionDialog extends StatelessWidget {
  final String content;
  final void Function()? onConfirm;
  final void Function()? onCancel;

  const DecisionDialog({
    required this.content,
    super.key,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.5, 1],
            colors: [
              Theme.of(context).colorScheme.onBackground,
              Theme.of(context).colorScheme.background,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Content
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: Text(
                  content,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),

              const SizedBox(height: 20),

              // Bottons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text(Localiser.of(context).wordConfirm),
                    onPressed: () {
                      onConfirm?.call();
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                  ),
                  ElevatedButton(
                    child: Text(Localiser.of(context).wordCancel),
                    onPressed: () {
                      onCancel?.call();
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('content', content))
      ..add(DiagnosticsProperty<Function?>('onConfirm', onConfirm))
      ..add(DiagnosticsProperty<Function?>('onCancel', onCancel));
  }
}
