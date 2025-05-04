import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlToDartWidget extends StatelessWidget {
  final String? htmlContent;

  const HtmlToDartWidget({super.key, this.htmlContent});

  @override
  Widget build(BuildContext context) {
    if (htmlContent == null || htmlContent!.trim().isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "No description available.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Html(
        data: htmlContent!,
        style: {
          "p": Style(
            fontSize: FontSize(16.0),
            color: Colors.black87,
            margin: Margins.only(bottom: 12),
          ),
          "strong": Style(
            fontWeight: FontWeight.bold,
            fontSize: FontSize(16.0),
          ),
          "span": Style(
            color: Colors.black87,
            fontSize: FontSize(16.0),
          ),
          "body": Style(
            fontFamily: 'Roboto', // You can change the font
            lineHeight: LineHeight.number(1.5),
          ),
        },
      ),
    );
  }
}
