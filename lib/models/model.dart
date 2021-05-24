import 'dart:developer';
import 'dart:math';

class Point {
  double x, y;
  Point(x, y) {
    this.x = x;
    this.y = y;
  }
}

class ShapeKavling {
  String shape, color;
  double width, height;
  Point position = Point(0.0, 0.0);
  List<Point> offset = [];
  ShapeKavling.fromMap(data) {
    shape = data.getAttribute('id').toString().contains('rect')
        ? "Rect"
        : "Polygon";
    if (data.getAttribute('x') != null) {
      position.x = double.parse(data.getAttribute('x'));
      position.y = double.parse(data.getAttribute('y'));
    }
    width = data.getAttribute('width') != null
        ? double.parse(data.getAttribute('width'))
        : findWidthPolygon(data.getAttribute('points'));
    height = data.getAttribute('height') != null
        ? double.parse(data.getAttribute('height'))
        : findHeightPolygon(data.getAttribute('points'));
    color = findColorHex(data.getAttribute('style'));
  }
  double findWidthPolygon(String points) {
    List<String> listPoint = points.replaceAll(' ', ',').split(',');
    listPoint.remove("");
    List<String> listTest = points.split(' ');
    listTest.remove("");
    List<double> doublePoint = listPoint.map((e) => double.parse(e)).toList();
    offset = listTest.map((e) {
      List elements = string2double(e);
      return Point(elements[0], elements[1]);
    }).toList();
    double minWidth = doublePoint[0], maxWidth = doublePoint[0];
    for (var i = 0; i < doublePoint.length; i++) {
      if (i % 2 == 0) {
        minWidth = doublePoint[i] < minWidth ? doublePoint[i] : minWidth;
        maxWidth = doublePoint[i] > maxWidth ? doublePoint[i] : maxWidth;
      }
    }
    this.position.x = minWidth;
    // inspect(doublePoint.reduce(min));
    // inspect(minWidth);
    // inspect(maxWidth);
    //inspect(listTest);
    return maxWidth - minWidth;
  }

  double findHeightPolygon(String points) {
    List<String> listPoint = points.replaceAll(' ', ',').split(',');
    listPoint.remove("");
    List<double> doublePoint = listPoint.map((e) => double.parse(e)).toList();
    double minHeight = doublePoint[0], maxHeight = doublePoint[0];
    for (var i = 0; i < doublePoint.length; i++) {
      if (i % 2 == 1) {
        minHeight = doublePoint[i] < minHeight ? doublePoint[i] : minHeight;
        maxHeight = doublePoint[i] > maxHeight ? doublePoint[i] : maxHeight;
      }
    }
    this.position.y = minHeight;
    // inspect(doublePoint.reduce(min));
    // inspect(minHeight);
    // inspect(maxHeight);
    // inspect(doublePoint);
    return maxHeight - minHeight;
  }

  String findColorHex(String styles) {
    List<String> listStyle = styles.split(';');
    listStyle.forEach((element) {
      if (element.contains('fill:')) {
        int idx = element.indexOf('#');
        styles = element.substring(idx + 1, element.length);
      }
    });
    // inspect(listStyle);
    return "0xff$styles";
  }

  List string2double(String strings) {
    List list = strings.split(',').toList();
    List listDouble = [0.0, 0.0];

    for (var i = 0; i < listDouble.length; i++) {
      i == 0
          ? listDouble[i] = double.parse(list[i])
          : listDouble[i] = double.parse(list[i]);
    }
    return listDouble;
  }
}
