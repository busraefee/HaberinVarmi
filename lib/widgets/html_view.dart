import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlView extends StatefulWidget {
  HtmlView({Key key, this.htmlData, this.isOnPrimaryText = false})
      : super(key: key);

  final String htmlData;
  final bool isOnPrimaryText;

  @override
  _HtmlViewState createState() => _HtmlViewState();
}

class _HtmlViewState extends State<HtmlView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.headline6.color;

    return Html(
      data: widget.htmlData,
      style: {
        "html": Style(backgroundColor: Colors.transparent),
        "p": Style(
            color: textColor,
            fontSize: FontSize(theme.textTheme.headline6.fontSize)),
        "li": Style(
            color: textColor,
            fontSize: FontSize(theme.textTheme.headline6.fontSize)),
        "a": Style(
            color: textColor,
            fontSize: FontSize(theme.textTheme.headline6.fontSize)),
        "table": Style(
          backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        "tr": Style(
          border: const Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
          padding: const EdgeInsets.all(6),
          backgroundColor: Colors.grey,
        ),
        "td": Style(
          padding: const EdgeInsets.all(6),
        ),
        "var": Style(fontFamily: 'serif'),
      },
    );
  }
}
