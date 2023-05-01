import 'package:awason/models/models.dart';
import 'package:awason/services/carrier_service.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final CarrierService _apiService = CarrierService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: Texts.miPerfil),
        body: FutureBuilder(
            future: _apiService.getCarrier(),
            builder: (BuildContext context,
                AsyncSnapshot<CarrierResponse> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final Carrier carrier = snapshot.data!.data!;
              return SafeArea(
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
                                      UserDisplayer(
                                          name:
                                              '${carrier.nombre} ${carrier.apellidos}',
                                          rating: carrier.calificacion),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.phone, color: blue),
                                          const SizedBox(width: 10),
                                          Text('${carrier.numContacto}')
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.email,
                                                color: blue),
                                            const SizedBox(width: 10),
                                            Text('${carrier.email}')
                                          ])
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CircularIconButton(
                                          icon: Icons.edit_outlined,
                                          onPressed: () => Navigator.pushNamed(
                                                  context, Routes.editProfile, arguments: carrier)
                                              .then((value) => setState(() {})))
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
                        subtitle: Text(
                          '${carrier.vehiculo!.marca} ${carrier.vehiculo!.modelo} ${carrier.vehiculo!.color} ${carrier.vehiculo!.matricula}',
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: CircularIconButton(
                          icon: Icons.edit_outlined,
                          onPressed: () =>
                              Navigator.pushNamed(context, Routes.editVehicle, arguments: carrier.vehiculo)
                                  .then((value) => setState(() {})),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.attach_money,
                            color: Colors.black, size: 35),
                        title: const Text(Texts.precio),
                        subtitle: Text(
                          '${carrier.precioGarrafon}',
                        ),
                        trailing: CircularIconButton(
                          icon: Icons.edit_outlined,
                          onPressed: () =>
                              Navigator.pushNamed(context, Routes.editPrice, arguments: carrier.precioGarrafon)
                                  .then((value) => setState(() {})),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              );
            }));
  }
}
