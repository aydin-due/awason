import 'package:awason/screens/screens.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    child: UserDisplayer(name: 'Nombre Apellido', rating: 4.5,),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text(Texts.verPerfil),
                    onTap: () => Navigator.pushNamed(context, Routes.profile),
                  ),
                  ListTile(
                    leading: const Icon(Icons.watch_later_rounded),
                    title: const Text(Texts.historial),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(Texts.cerrarSesion),
              onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false)
            ),
          ],
        ),
      ),
    );
  }
}