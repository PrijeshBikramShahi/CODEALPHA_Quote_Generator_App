import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quotes_app/quote_gen.dart';
import 'package:share_plus/share_plus.dart';

class ShareSec extends StatelessWidget {
  ShareSec({
    super.key,
    required this.quote,
  });

  final QuotesGetter? quote;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: () {
          Share.share('${quote?.q ?? ''} by ${quote?.a ?? ''}',
              subject: 'Share Quote by ${quote?.a ?? ''}');
        },
        child: Container(
          padding: EdgeInsets.only(right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  margin: EdgeInsets.all(8),
                  child: FaIcon(
                    FontAwesomeIcons.arrowUpFromBracket,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
