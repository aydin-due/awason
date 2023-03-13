import 'package:awason/models/models.dart';
import 'package:awason/screens/screens.dart';
import 'package:awason/services/services.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final ApiService _apiService = ApiService();

  logout() async {
    const storage = FlutterSecureStorage();
    storage.delete(key: 'user');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiService.getCarrier(),
        builder:
            (BuildContext context, AsyncSnapshot<CarrierResponse> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final CarrierResponse carrier = snapshot.data!;
          return Drawer(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        DrawerHeader(
                          child: UserDisplayer(
                            name:
                                '${carrier.data!.nombre} ${carrier.data!.apellidos}',
                            rating: carrier.data!.calificacion!,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text(Texts.verPerfil),
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.profile)
                                  .then((value) => setState(() {})),
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
                      onTap: () => logout()),
                ],
              ),
            ),
          );
        });
  }
}
