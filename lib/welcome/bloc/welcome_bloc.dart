
import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_states.dart';
part 'welcome_events.dart';
class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeState>{
  WelcomeBloc() : super(WelcomeState()){
    on<WelcomeEvent>((event, emit){
      emit(WelcomeState(
        page: state.page
      ));
    });

  }
}