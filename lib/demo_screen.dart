import 'package:dem/technology_model.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink[200],
        title: Text(
          "Folding Cell Demo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return SimpleFoldingCell.create(
              frontWidget: _buildFrontWidget(index),
              innerWidget: _buildInnerBottomWidget(),
              cellSize: Size(MediaQuery.of(context).size.width, 125),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 200),
              borderRadius: 10,
              onOpen: () => print('$index cell opened'),
              onClose: () => print('$index cell closed'),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          color: Colors.cyan[100],
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Aeologic Technology",
                style: GoogleFonts.aldrich(
                  color: Color(0xFF2e282a),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                onPressed: () {
                  final foldingCellState =
                      context.findAncestorStateOfType<SimpleFoldingCellState>();
                  foldingCellState?.toggleFold();
                },
                child: Text(
                  "OPEN",
                ),
                textColor: Colors.white,
                color: Colors.indigoAccent[100],
                splashColor: Colors.white.withOpacity(0.5),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInnerBottomWidget() {
    return Builder(builder: (context) {
      return Container(
        color: Colors.blueGrey[50],
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: FlatButton(
            onPressed: () {
              final foldingCellState =
                  context.findAncestorStateOfType<SimpleFoldingCellState>();
              foldingCellState?.toggleFold();
            },
            child: Text(
              "Close",
            ),
            textColor: Colors.white,
            color: Colors.redAccent[100],
            splashColor: Colors.white.withOpacity(0.5),
          ),
        ),
      );
    });
  }

  Widget _buildInnerWidget(int index) {
    return Builder(
      builder: (context) {
        return Container(
          color: Colors.pink[100],
          padding: EdgeInsets.only(top: 10),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Abc",
              style: GoogleFonts.aldrich(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
        );
      },
    );
  }
}
