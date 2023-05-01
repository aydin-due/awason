import 'package:awason/models/models.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review, required this.length,
  });

  final Review review;
  final int length;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        width: length > 1 ? 0.8 : 0.9,
        child: Column(
          children: [
            Center(
                child: SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Icon(
                  index < int.parse('${review.calificacion}')
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                ),
              ),
            )),
            const SizedBox(height: 10),
            Text('${review.comentario}')
          ],
        ));
  }
}
