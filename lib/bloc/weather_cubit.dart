import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_states/states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/services/weather_services.dart';

class Weathercubit extends Cubit<Weatherstates> {
  Weathercubit(this.weather) : super(Initstate());
  Weather_Services weather;
  Weather_Model? model;
  String? city;
  void getweather({required String city}) async {
    try {
      emit(Loadingstate());
      model = await weather.get_weather(city: city);
      emit(Successstate());
    } catch (e) {
      emit(Faildstate());
    }
  }
}
