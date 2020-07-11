import 'package:flutter/material.dart';

class FadeInRoute extends PageRouteBuilder {

  final Widget view;

  FadeInRoute({
    this.view
  }) : super(
    pageBuilder: (context, ani, secondaryAni) => view,
    transitionsBuilder: (context, ani, secondaryAni, child) => FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1
      ).animate(ani),
      child: child
    )
  );
}