import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});
  void showCustomSnacbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
        content: const Text('Hola Mundo'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Undo')));
          },
        ));

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
                title: const Text('Estas seguro?'),
                content: const Text(
                    'Eu sunt ipsum adipisicing exercitation sunt duis exercitation ipsum. Eu magna duis eiusmod sit aliquip qui sit fugiat labore officia dolore velit. Elit pariatur incididunt nulla voluptate dolor deserunt. Lorem excepteur elit deserunt laboris minim amet magna deserunt culpa. Velit incididunt pariatur aliqua magna qui dolore. In aliquip et nostrud qui anim quis occaecat mollit excepteur voluptate.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar')),
                  FilledButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Aceptar'))
                ]));
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Esse ex sunt ipsum magna ut qui laboris enim dolore commodo do. Occaecat ex velit sint enim qui. Proident exercitation exercitation anim ex fugiat officia aliquip nisi fugiat incididunt quis deserunt. Occaecat ipsum reprehenderit adipisicing duis amet culpa eiusmod labore do. Deserunt laborum voluptate dolor excepteur.')
                  ]);
                },
                child: const Text('Licencias Usadas')),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text(
                'Mostrar Dialogo ',
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showCustomSnacbar(context),
          label: const Text('Mosstrar Snackbar'),
          icon: const Icon(Icons.remove_red_eye_outlined)),
    );
  }
}
