import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReuseableCard(),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0XFFFF1D1E33),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0XFFFF1D1E33),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0XFFFF1D1E33),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0XFFFF1D1E33),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class ReuseableCard extends StatelessWidget {
  const ReuseableCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(0XFFFF1D1E33),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
