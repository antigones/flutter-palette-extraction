import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'package:image/image.dart';
import 'package:scidart/numdart.dart';
import 'package:image/image.dart' as img;
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart' as mat;
import 'dart:math';
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  mat.Color color0 = Colors.white;

  mat.Color color1 = Colors.white;

  mat.Color color2 = Colors.white;

  mat.Color color3 = Colors.white;

  mat.Color color4 = Colors.white;

  mat.Color color5 = Colors.white;

  mat.Color color6 = Colors.white;

  mat.Color color7 = Colors.white;

  mat.Color color8 = Colors.white;

  mat.Color color9 = Colors.white;

  String text0 = "";
  String text1 = "";
  String text2 = "";
  String text3 = "";
  String text4 = "";
  String text5 = "";
  String text6 = "";
  String text7 = "";
  String text8 = "";
  String text9 = "";
  String imagePath = 'assets/berries.jpg';

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:
        SingleChildScrollView(

        child:
        Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('test.gif'),

        Wrap(
          direction: Axis.horizontal,
          children: [
            ...[
              color0,
              color1,
              color2,
              color3,
              color4,
              color5,
              color6,
              color7,
              color8,
              color9,
            ].map(
                  (color) => Container(
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width / 2,
                color: color,
                alignment: Alignment.center,
                child: Text(
                  color.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),

          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getPalette1,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _drawPalette(List<Color> colorPalette) {
    setState(() {
      color0 = colorPalette[0];
      color1 = colorPalette[1];
      color2 = colorPalette[2];
      color3 = colorPalette[3];
      color4 = colorPalette[4];
      color5 = colorPalette[5];
      color6 = colorPalette[6];
      color7 = colorPalette[7];
      color8 = colorPalette[8];
      color9 = colorPalette[9];

      text0 = colorPalette[0].toString();
      text1 = colorPalette[1].toString();
      text2 = colorPalette[2].toString();
      text3 = colorPalette[3].toString();
      text4 = colorPalette[4].toString();
      text5 = colorPalette[5].toString();
      text6 = colorPalette[6].toString();
      text7 = colorPalette[7].toString();
      text8 = colorPalette[8].toString();
      text9 = colorPalette[9].toString();
    });
    print(colorPalette);
  }

  void resetValues() {
    color0 = Colors.white;
    color1 = Colors.white;
    color2 = Colors.white;
    color3 = Colors.white;
    color4 = Colors.white;
    color5 = Colors.white;
    color6 = Colors.white;
    color7 = Colors.white;
    color8 = Colors.white;
    color9 = Colors.white;

    text0 = "";
    text1 = "";
    text2 = "";
    text3 = "";
    text4 = "";
    text5 = "";
    text6 = "";
    text7 = "";
    text8 = "";
    text9 = "";
  }

  List<List<int>> splitPixels(List colors, int medianValue, int dimension) {
    List<List<int>> bins = [[], []];
    //List<int> pixelChannels = [img.getRed(color)];
    if (dimension == 0) {
      for (int i = 0; i < colors.length; i++) {
        int color = colors[i];
        int r = img.getRed(color);
        if (r <= medianValue)
          bins[0].add(color);
        else
          bins[1].add(color);
      }
    }
    if (dimension == 1) {
      for (int i = 0; i < colors.length; i++) {
        int color = colors[i];
        int g = img.getGreen(color);
        if (g <= medianValue)
          bins[0].add(color);
        else
          bins[1].add(color);
      }
    }
    if (dimension == 2) {
      for (int i = 0; i < colors.length; i++) {
        int color = colors[i];
        int b = img.getBlue(color);
        if (b <= medianValue)
          bins[0].add(color);
        else
          bins[1].add(color);
      }
    }
    //print(bins[0].length);
    //print(bins[1].length);
    // 0: lower, 1:upper
    return bins;
  }

  int calcMedianValue(List<int> values) {
    values.sort();
    int mIdx = (values.length / 2).round();
    return values[mIdx];
  }

  Map getMaxSpanDimension(List bins) {
    Map maxRange = {};
    List ranges = [];

    for (int i = 0; i < bins.length; i++) {
      List colors = bins[i];
      List<int> rList = [];
      List<int> gList = [];
      List<int> bList = [];

      for (int j = 0; j < colors.length; j++) {
        int color = colors[j];

        int r = img.getRed(color);
        int g = img.getGreen(color);
        int b = img.getBlue(color);

        rList.add(r);
        gList.add(g);
        bList.add(b);
      }
      rList.sort();
      gList.sort();
      bList.sort();
      //print('gList.sort();');
      //print(gList);
      int rMax = rList[rList.length - 1];
      int rMin = rList[0];
      int gMax = gList[gList.length - 1];
      int gMin = gList[0];
      int bMax = bList[bList.length - 1];
      int bMin = bList[0];
      ranges.add({
        'color': 0,
        'index': i,
        'list': colors,
        'range': rMax - rMin,
        'rList': rList,
        'gList': gList,
        'bList': bList,
        'rMax': rMax,
        'rMin': rMin,
        'gMax': gMax,
        'gMin': gMin,
        'bMax': bMax,
        'bMin': bMin
      });
      ranges.add({
        'color': 1,
        'index': i,
        'list': colors,
        'range': gMax - gMin,
        'rList': rList,
        'gList': gList,
        'bList': bList,
        'rMax': rMax,
        'rMin': rMin,
        'gMax': gMax,
        'gMin': gMin,
        'bMax': bMax,
        'bMin': bMin
      });
      ranges.add({
        'color': 2,
        'index': i,
        'list': colors,
        'range': bMax - bMin,
        'rList': rList,
        'gList': gList,
        'bList': bList,
        'rMax': rMax,
        'rMin': rMin,
        'gMax': gMax,
        'gMin': gMin,
        'bMax': bMax,
        'bMin': bMin
      });
    }
    ranges.sort((a, b) => a['range'].compareTo(b['range']));

    maxRange = ranges[ranges.length - 1];

    return maxRange;
  }

  List processBins(int i, List groups) {
    if (i < 9) {
      List<List> bins = [];

      Map groupToSplit = getMaxSpanDimension(groups);
      //print('iteration: '+i.toString());
      if (groupToSplit['color'] == 0) {
        //print('splitting along red');
        int medianValue = calcMedianValue(groupToSplit['rList']);
        bins = splitPixels(groups[groupToSplit['index']], medianValue, 0);
      }

      if (groupToSplit['color'] == 1) {
        //print('splitting along green');
        int medianValue = calcMedianValue(groupToSplit['gList']);
        bins = splitPixels(groups[groupToSplit['index']], medianValue, 1);
      }

      if (groupToSplit['color'] == 2) {
        //print('splitting along blue');
        int medianValue = calcMedianValue(groupToSplit['bList']);
        bins = splitPixels(groups[groupToSplit['index']], medianValue, 2);
      }

      groups.removeAt(groupToSplit['index']);
      groups.insert(0, bins[0]);
      groups.insert(0, bins[1]);

      return processBins(i + 1, groups);
    } else {
      //print('returning from processBins');
      //print('groups');
      //print(groups.length);
      return groups;
    }
  }

  void getPalette2() async {
    print('palette2');
    ByteData bytes = await rootBundle.load(imagePath);
    var imageBytes = bytes.buffer.asUint8List();
    img.Image? myImage = img.decodeImage(imageBytes);

    int? w = myImage?.width;
    int? h = myImage?.height;

    List<List> bins = [[]];

    for (int x = 0; x < w!; x++) {
      for (int y = 0; y < h!; y++) {
        int? color = myImage?.getPixel(x, y);

        bins[0].add(color!);
      }
    }
    print('image processed');
    List totBins = [bins[0]];
    //totBins = processBins(bins[0]);

    // processBins split the current bin in two
    int i = 0;

    List gs = processBins(i, totBins);

    //print('gs');
    //print(gs.length);

    List<mat.Color> colorPalette = [];
    for (int j = 0; j < gs.length; j++) {
      int sumR = 0;
      int sumG = 0;
      int sumB = 0;
      // get colors in bin
      List colors = gs[j];
      //print('gs[j]');

      for (int c = 0; c < colors.length; c++) {
        int color = colors[c];

        int r = img.getRed(color);
        int g = img.getGreen(color);
        int b = img.getBlue(color);
        sumR = sumR + r;
        sumG = sumG + g;
        sumB = sumB + b;
      }

      int avgR = (sumR / colors.length).toInt();
      int avgG = (sumG / colors.length).toInt();
      int avgB = (sumB / colors.length).toInt();

      mat.Color finalColor = mat.Color(img.Color.fromRgb(avgB, avgG, avgR));
      colorPalette.add(finalColor);

      //print('colorPalette');
      //print(colorPalette);
    }

    _drawPalette(colorPalette);
  }

  Future<ui.Image> getUiImage(String imageAssetPath) async {
    final ByteData assetImageByteData = await rootBundle.load(imageAssetPath);
    //img.Image? baseSizeImage = img.decodeImage(assetImageByteData.buffer.asUint8List());
    //img.Image resizeImage = img.copyResize(baseSizeImage!, height: height, width: width);
    ui.Codec codec =
        await ui.instantiateImageCodec(assetImageByteData.buffer.asUint8List());
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  Iterable<Color> _getImagePixels(
      ByteData pixels, int width, int height) sync* {
    final int rowStride = width * 4;
    int rowStart;
    int rowEnd;
    int colStart;
    int colEnd;

    rowStart = 0;
    rowEnd = height;
    colStart = 0;
    colEnd = width;

    int byteCount = 0;
    for (int row = rowStart; row < rowEnd; ++row) {
      for (int col = colStart; col < colEnd; ++col) {
        final int position = row * rowStride + col * 4;
        // Convert from RGBA to ARGB.
        final int pixel = pixels.getUint32(position);
        final Color result = Color((pixel << 24) | (pixel >> 8));
        byteCount += 4;
        yield result;
      }
    }
    assert(byteCount == ((rowEnd - rowStart) * (colEnd - colStart) * 4));
  }

  void getPalette1() async {
    resetValues();
    ByteData bytes = await rootBundle.load(imagePath);
    var imageBytes = bytes.buffer.asUint8List();
    img.Image? myImage = img.decodeImage(imageBytes);

    int? w = myImage?.width;
    int? h = myImage?.height;

    Map<Tuple3<num, num, num>, List<int>> bins =
        <Tuple3<num, num, num>, List<int>>{};

    for (int i = 0; i < 3; i++)
      for (int j = 0; j < 3; j++)
        for (int k = 0; k < 3; k++) bins[new Tuple3(i, j, k)] = [];

    for (int x = 0; x < w!; x++) {
      for (int y = 0; y < h!; y++) {
        int? color = myImage?.getPixel(x, y);
        int r = img.getRed(color!);
        int g = img.getGreen(color);
        int b = img.getBlue(color);

        // calculate bin for the current pixel to be placed in
        int first = 0;
        int second = 0;
        int third = 0;

        if (r >= 0 && r <= 85) first = 0;
        if (r >= 86 && r <= 170) first = 1;
        if (r >= 171 && r <= 255) first = 2;

        if (g >= 0 && g <= 85) second = 0;
        if (g >= 86 && g <= 170) second = 1;
        if (g >= 171 && g <= 255) second = 2;

        if (b >= 0 && b <= 85) third = 0;
        if (b >= 86 && b <= 170) third = 1;
        if (b >= 171 && b <= 255) third = 2;

        //print(r.toString() + " " + g.toString() + " " + b.toString());

        // split the space into 3x3 grid

        bins[new Tuple3(first, second, third)]?.add(color);
      }
    }

    Map<int, List<Tuple3<num, num, num>>> count =
        <int, List<Tuple3<num, num, num>>>{};
    // better to use a list to put clashing bins together
    for (int first = 0; first < 3; first++) {
      for (int second = 0; second < 3; second++) {
        for (int third = 0; third < 3; third++) {
          if (count[bins[new Tuple3(first, second, third)]!.length] == null) {
            count[bins[new Tuple3(first, second, third)]!.length] = [
              new Tuple3(first, second, third)
            ];
          } else
            count[bins[new Tuple3(first, second, third)]!.length]!
                .add(new Tuple3(first, second, third));
        }
      }
    }
    List<int> sortedKeys = count.keys.toList()..sort((a, b) => b.compareTo(a));

    // take top x keys
    int x = 10;
    List topTenKeys = [];
    for (int i = 0; i < x; i++) {
      topTenKeys.add(sortedKeys[i]);
    }
    List<mat.Color> colorPalette = [];
    /*
    Instead of summing up the components of the RGB color, sum their squares instead.
    Then when returning the average color, for each color component, find the mean of the sum (of squares)
    and return its square root.
    */
    for (int i = 0; i < topTenKeys.length; i++) {
      List<Tuple3<num, num, num>>? bs = count[topTenKeys[i]];

      int sumR = 0;
      int sumG = 0;
      int sumB = 0;

      for (int j = 0; j < bs!.length; j++) {
        Tuple3<num, num, num> bin = bs[j];
        // get colors in bin
        List<int>? colors = bins[bin];
        if (colors!.length > 0) {
          for (int c = 0; c < colors.length; c++) {
            int color = colors[c];
            int r = img.getRed(color);
            int g = img.getGreen(color);
            int b = img.getBlue(color);
            sumR = sumR + r;
            sumG = sumG + g;
            sumB = sumB + b;
          }

          int avgR = (sumR / colors.length).floor().toInt();
          int avgG = (sumG / colors.length).floor().toInt();
          int avgB = (sumB / colors.length).floor().toInt();

          mat.Color finalColor = mat.Color(img.Color.fromRgb(avgB, avgG, avgR));
          colorPalette.add(finalColor);
        }
      }
    }

    _drawPalette(colorPalette);
  }

  void getRawPalette1() async {
    resetValues();

    ui.Image originalUIImage = await getUiImage(imagePath);
    ByteData? myImage = await originalUIImage.toByteData(
        format: ui.ImageByteFormat.rawUnmodified);
    int? w = originalUIImage.width;
    int? h = originalUIImage.height;

    Iterable<Color> imageColors = _getImagePixels(myImage!, w, h);

    var bins = <Tuple3<num, num, num>, List<Color>>{};

    for (int i = 0; i < 3; i++)
      for (int j = 0; j < 3; j++)
        for (int k = 0; k < 3; k++) bins[new Tuple3(i, j, k)] = [];

    for (Color col in imageColors) {
      int r = col.red;
      int g = col.green;
      int b = col.blue;
      // calculate bin for the current pixel to be placed in
      int first = 0;
      int second = 0;
      int third = 0;

      if (r >= 0 && r <= 85) first = 0;
      if (r >= 86 && r <= 170) first = 1;
      if (r >= 171 && r <= 255) first = 2;

      if (g >= 0 && g <= 85) second = 0;
      if (g >= 86 && g <= 170) second = 1;
      if (g >= 171 && g <= 255) second = 2;

      if (b >= 0 && b <= 85) third = 0;
      if (b >= 86 && b <= 170) third = 1;
      if (b >= 171 && b <= 255) third = 2;

      // split the space into 3x3 grid

      bins[new Tuple3(first, second, third)]?.add(col);
    }

    var count = <int, List<Tuple3<num, num, num>>>{};
    // better to use a list to put clashing bins together
    for (int first = 0; first < 3; first++) {
      for (int second = 0; second < 3; second++) {
        for (int third = 0; third < 3; third++) {
          if (count[bins[new Tuple3(first, second, third)]!.length] == null) {
            count[bins[new Tuple3(first, second, third)]!.length] = [
              new Tuple3(first, second, third)
            ];
          } else
            count[bins[new Tuple3(first, second, third)]!.length]!
                .add(new Tuple3(first, second, third));
        }
      }
    }
    var sortedKeys = count.keys.toList()..sort((a, b) => b.compareTo(a));

    // take top x keys
    int x = 10;
    List topTenKeys = [];
    for (int i = 0; i < x; i++) {
      topTenKeys.add(sortedKeys[i]);
    }
    List<mat.Color> colorPalette = [];
    /*
    Instead of summing up the components of the RGB color, sum their squares instead.
    Then when returning the average color, for each color component, find the mean of the sum (of squares)
    and return its square root.
    */
    for (int i = 0; i < topTenKeys.length; i++) {
      List<Tuple3<num, num, num>>? bs = count[topTenKeys[i]];

      int sumR = 0;
      int sumG = 0;
      int sumB = 0;

      for (int j = 0; j < bs!.length; j++) {
        Tuple3<num, num, num> bin = bs[j];
        // get colors in bin
        List<Color>? colors = bins[bin];
        if (colors!.length > 0) {
          for (int c = 0; c < colors.length; c++) {
            int r = colors[c].red;
            int g = colors[c].green;
            int b = colors[c].blue;
            sumR = sumR + r;
            sumG = sumG + g;
            sumB = sumB + b;
          }

          int avgR = (sumR / colors.length).floor().toInt();
          int avgG = (sumG / colors.length).floor().toInt();
          int avgB = (sumB / colors.length).floor().toInt();

          mat.Color finalColor = mat.Color(img.Color.fromRgb(avgB, avgG, avgR));
          colorPalette.add(finalColor);
        }
      }
    }
    _drawPalette(colorPalette);
  }
}
