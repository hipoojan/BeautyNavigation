library beauty_navigation;

import 'package:flutter/material.dart';

class BeautyNavigation extends StatefulWidget {
  final Color backgroundColor;
  final double height;
  final List<Items> items;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final Color circleColor;
  final Duration animationDuration;

  const BeautyNavigation({
    @required this.items,
    this.height = 100,
    this.backgroundColor = Color(0xff273564),
    this.activeIconColor = Color(0xffFF6B4D),
    this.inactiveIconColor = Colors.white,
    this.circleColor = Colors.white,
    this.animationDuration = Duration(milliseconds: 500),
  }) : assert(items != null);

  @override
  BeautyNavigationState createState() => BeautyNavigationState();
}

class BeautyNavigationState extends State<BeautyNavigation> {
  double circleX;
  int active = 0;
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(color: widget.backgroundColor, boxShadow: [
        BoxShadow(color: Colors.black38, blurRadius: 4, spreadRadius: 2),
      ]),
      child: Stack(
        children: <Widget>[
          backgroundAnimation(widget.animationDuration, widget.circleColor),
          setUpRow(widget.items),
        ],
      ),
    );
  }

  Widget setUpRow(List<Items> items) {
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < items.length; i++) {
      list.add(setUpIcons(
          items[i].getIcon(), items[i].getTabName(), i, items[i].getOnClick()));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: list);
  }

  Widget setUpIcons(Icon i, String s, int n, VoidCallback onClick) {
    if (widget.items.length < 2 || widget.items.length > 4) {
      throw new Exception(
          'Only 2-4 items are allowed for the Navigation bar to look beautiful');
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        AnimatedContainer(
          curve: Curves.easeInOutBack,
          transform: Matrix4.translationValues(
              0, isActive && n == active ? -20 : 0, 0),
          child: IconButton(
            icon: i,
            iconSize: isActive && n == active ? 45 : 35,
            color: isActive && n == active
                ? widget.activeIconColor
                : widget.inactiveIconColor,
            onPressed: () {
              onClick();
              setState(() {
                active = n;
              });
            },
          ),
          duration: widget.animationDuration,
        ),
        isActive && n == active
            ? Container(
                transform: Matrix4.translationValues(0, -10, 0),
                child: Text(
                  '$s',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            : Container(),
      ],
    );
  }

  Widget backgroundAnimation(Duration d, Color bg) {
    int items = widget.items.length;
    double screenW = MediaQuery.of(context).size.width;
    double dim = 62;
    var translation;
    var center = (screenW / 2) - dim / 2;
    switch (items) {
      case 2:
        if (active == 0) {
          translation =
              Matrix4.translationValues(center - (dim * 1.22), -10, 0);
        } else {
          translation =
              Matrix4.translationValues(center + (dim * 1.22), -10, 0);
        }
        break;
      case 3:
        if (active == 0) {
          translation =
              Matrix4.translationValues(center - (dim * 1.82), -10, 0);
        } else if (active == 1) {
          translation = Matrix4.translationValues(center, -10, 0);
        } else {
          translation =
              Matrix4.translationValues(center + (dim * 1.82), -10, 0);
        }
        break;
      case 4:
        if (active == 0) {
          translation = Matrix4.translationValues(center - (dim*2.18), -10, 0);
        } else if (active == 1) {
          translation = Matrix4.translationValues(center - (dim*0.73), -10, 0);
        } else if (active == 2) {
          translation = Matrix4.translationValues(center + (dim*0.73), -10, 0);
        } else {
          translation = Matrix4.translationValues(center + (dim*2.18), -10, 0);
        }
        break;
    }

    return AnimatedContainer(
      transform: translation,
      curve: Curves.easeInOutBack,
      alignment: Alignment.center,
      height: dim,
      width: dim,
      decoration: BoxDecoration(shape: BoxShape.circle, color: bg, boxShadow: [
        BoxShadow(color: Colors.black45, blurRadius: 2, spreadRadius: 2)
      ]),
      duration: d,
    );
  }
}

class Items extends StatelessWidget {
  final Icon icon;
  final String tabName;
  final VoidCallback onClick;

  const Items(
      {@required this.icon, @required this.tabName, @required this.onClick})
      : assert(icon != null),
        assert(tabName != null),
        assert(onClick != null);

  Icon getIcon() {
    return icon;
  }

  String getTabName() {
    return tabName;
  }

  VoidCallback getOnClick() {
    return onClick;
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
