import 'package:flutter/material.dart';
import 'constant.dart';
import 'reuseable_card.dart';
import 'bottom_button.dart';

class Result extends StatelessWidget {
  Result({@required this.result});
final int result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppBarTitle),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Text(
                'Sonuç',
                style: kTitleLabelStyle,
              ),
            ),
            Expanded(
              flex: 5,
              child: ReuseableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Normal',
                      style: kResultTextStyle,
                    ),
                    Text(
                      result.toString(),
                      style: kBmiResultTextStyle,
                    ),
                    Text(
                      'Your result is quite low. You should eat more!',
                      style: kResultDescTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    BottomButton(
                      label: 'Yeniden Hesapla',
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
