import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Texts.miPerfil),
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Card(
                elevation: 5,
                shape: cardDecor,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            const UserDisplayer(
                                name: 'Nombre Apellido', rating: 4.5),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.phone, color: blue),
                                SizedBox(width: 10),
                                Text('1234567890')
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.email, color: blue),
                                  SizedBox(width: 10),
                                  Text('tomasito@gmail.com')
                                ])
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BlueCircularIconButton(
                                icon: Icons.edit_outlined, onPressed: () => Navigator.pushNamed(context, Routes.editProfile))
                          ],
                        
                        )
                      ],
                    )),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.airport_shuttle,
                  color: Colors.black, size: 35),
              title: const Text(Texts.vehiculo),
              subtitle: const Text(
                'Nissan Versa gris - AW8JSO',
                overflow: TextOverflow.ellipsis,
              ),
              trailing: BlueCircularIconButton(icon: Icons.edit_outlined, onPressed: () => Navigator.pushNamed(context, Routes.editVehicle),),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.location_on_outlined,
                  color: Colors.black, size: 35),
              title: const Text(Texts.codigoPostal),
              subtitle: const Text(
                '12345',
              ),
              trailing: BlueCircularIconButton(icon: Icons.edit_outlined, onPressed: () => Navigator.pushNamed(context, Routes.editSector),),
            ),
            const Divider(),
            
          ],
        ),
      ),
    ));
  }
}