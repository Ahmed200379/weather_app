
class Weather_Model
{
  String  date;
  double aver_temp;
  double max_temp;
  double min_temp;
  String weather_state;
  String icon_data;
  Weather_Model({
    required this.date,required this.aver_temp,required this.min_temp,required this.max_temp,required this.icon_data,required this.weather_state
  });
  factory Weather_Model.fromjson(dynamic data){
    var json_data=data['forecast']['forecastday'][0]['day'];
    return Weather_Model( date: data['location']['localtime'],
        aver_temp: json_data['avgtemp_c'],
        min_temp: json_data['mintemp_c'],
        max_temp: json_data['maxtemp_c'],
        icon_data: json_data['condition']['icon'],
        weather_state: json_data['condition']['text']);
  }
}