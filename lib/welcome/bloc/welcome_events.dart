part of 'welcome_bloc.dart';

class WelcomeEvent extends Equatable{
 const WelcomeEvent({this.index = 0});
 final int index;

  @override
  List<Object?> get props => [index];
}


