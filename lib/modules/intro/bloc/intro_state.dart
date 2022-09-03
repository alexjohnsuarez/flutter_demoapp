part of 'intro_bloc.dart';

abstract class IntroState extends Equatable {
  const IntroState();

  @override
  List<Object> get props => [];
}

class IntroInitial extends IntroState {}

class IntroLoadState extends IntroState {}

class IntroNextState extends IntroState {}
