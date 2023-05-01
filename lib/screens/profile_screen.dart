import 'package:awason/models/models.dart';
import 'package:awason/services/services.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: const CustomAppBar(title: Texts.perfilCliente),
        body: FutureBuilder(
            future: ClientService().getClient(id),
            builder:
                (BuildContext context, AsyncSnapshot<ClientResponse> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final Client client = snapshot.data!.data!;
              final List<Review>? reviews = snapshot.data!.data!.reviews;
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
                              child: Column(
                                children: [
                                  UserDisplayer(
                                      name:
                                          '${client.nombre} ${client.apellidos}',
                                      rating: client.calificacion),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.phone, color: blue),
                                      const SizedBox(width: 10),
                                      Text('${client.numContacto}')
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.email, color: blue),
                                        const SizedBox(width: 10),
                                        Text('${client.email}')
                                      ])
                                ],
                              )),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (reviews != null && reviews.isNotEmpty) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            Texts.reviews,
                            style: appbarTitle,
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final Review review = reviews[index];
                            return ReviewCard(
                                review: review, length: reviews.length);
                          },
                          itemCount: reviews.length,
                        ))
                      ]
                    ],
                  ),
                ),
              );
            }));
  }
}
