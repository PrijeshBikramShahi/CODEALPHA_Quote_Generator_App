import 'package:flutter/material.dart';
import 'package:quotes_app/quote_gen.dart';

class QuoteSec extends StatelessWidget {
  const QuoteSec({
    super.key,
    required this.quote,
  });

  final QuotesGetter? quote;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text(
                  quote?.q ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontFamily: 'Quote',
                  ),
                ),
                Text(
                  quote?.q ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 44,
                    fontFamily: 'Quote',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Icon(
              Icons.bubble_chart_sharp,
              size: 60,
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                Text(
                  "- ${quote?.a ?? ''}",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Author',
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1,
                  ),
                ),
                Text(
                  "- ${quote?.a ?? ''}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Author',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}