import 'package:flutter/material.dart';

/// [NavigationService] is a class used to reduce the
/// long call of Navigator class into shorter version
class NavigationService {
  /// The Constructor
  /// Usage:
  ///
  /// NavigationService(context).push(HomeView());
  NavigationService(this.context);

  /// The current context in which the navigation is to be performed
  final BuildContext context;

  PageRoute<T> _getRoute<T>(
    Widget screen, {
    bool fullscreenDialog = false,
  }) {
    return MaterialPageRoute(
      builder: (c) => screen,
      fullscreenDialog: fullscreenDialog,
      settings: RouteSettings(name: screen.runtimeType.toString()),
    );
  }

  ///
  Future<T?> pushAndRemoveUntil<T>(Widget screen) {
    return Navigator.of(context)
        .pushAndRemoveUntil<T>(_getRoute(screen), (route) => false);
  }

  ///
  Future<T?> push<T>(
    Widget screen, {
    bool rootNavigator = false,
    bool fullscreendialog = false,
  }) {
    return Navigator.of(context, rootNavigator: rootNavigator)
        .push<T>(_getRoute(screen, fullscreenDialog: fullscreendialog));
  }

  ///
  Future<T?> pushReplacement<T>(
    Widget screen, {
    bool rootNavigator = false,
    bool fullscreendialog = false,
  }) {
    return Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).pushReplacement(_getRoute(screen, fullscreenDialog: fullscreendialog));
  }

  ///
  Future<T?> pushSlideUp<T>(
    Widget screen, {
    bool rootNavigator = false,
    bool fullScreenDialog = false,
  }) {
    return Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).push(SlideRoute<T>(child: screen, fullscreenDialog: fullScreenDialog));
  }

  ///
  Future<T?> pushSlideLeft<T>(
    Widget screen, {
    bool rootNavigator = false,
    bool fullScreenDialog = false,
  }) {
    return Navigator.of(
      context,
      rootNavigator: rootNavigator,
    ).push<T>(
      SlideRoute<T>(
        child: screen,
        fullscreenDialog: fullScreenDialog,
        offset: const Offset(1, 0),
      ),
    );
  }
}

///
class SlideRoute<T> extends PageRouteBuilder<T> {
  ///
  SlideRoute({
    required this.child,
    super.fullscreenDialog,
    this.offset,
  }) : super(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (a, b, c) => child,
          settings: RouteSettings(name: child.runtimeType.toString()),
        );

  ///
  final Widget child;

  ///
  final Offset? offset;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: offset ?? const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
