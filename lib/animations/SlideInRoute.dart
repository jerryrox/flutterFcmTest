import 'package:flutter/material.dart';

class SlideInRoute extends PageRouteBuilder {

  final Widget view;

  SlideInRoute({
    this.view
  }) : super(
    pageBuilder: (context, ani, secondaryAni) => view,
    transitionsBuilder: (context, ani, secondaryAni, child) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero
      ).animate(ani),
      child: child
    )
  );
}