part of 'splash_cubit.dart';

// ConnectionStatus is a class set state of connection
@immutable
abstract class ConnectionStatus {}

class ConnectionInitial extends ConnectionStatus {}

class ConnectionOn extends ConnectionStatus {}

class ConnectionOff extends ConnectionStatus {}
