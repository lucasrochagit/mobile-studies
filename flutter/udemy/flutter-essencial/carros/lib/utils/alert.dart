import 'package:flutter/material.dart';

alert(BuildContext context, String msg) {
  showDialog(
      barrierDismissible: false,
      // only click on alert dialog options to close
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false, // does not allow close on back button
          child: AlertDialog(
            title: const Text('Carros'),
            content: Text(msg),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              )
            ],
          ),
        );
      });
}

alertLogout(BuildContext context, VoidCallback onPressedYes) {
  showDialog(
      barrierDismissible: false,
      // only click on alert dialog options to close
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false, // does not allow close on back button
          child: AlertDialog(
            title: Text("Deseja fazer logout?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Não'),
              ),
              TextButton(
                onPressed: onPressedYes,
                child: const Text('Sim'),
              ),
            ],
          ),
        );
      });
}
