class Weather {
  int? id;
  String? weatherStateName;
  String? weatherStateAbbr;
  String? windDirectionCompass;
  String? created;
  String? applicableDate;
  double? minTemp;
  double? maxTemp;
  double? theTemp;
  double? windSpeed;
  double? windDirection;
  double? airPressure;
  int? humidity;
  double? visibility;
  int? predictability;

  Weather(
      {this.id,
      this.weatherStateName,
      this.weatherStateAbbr,
      this.windDirectionCompass,
      this.created,
      this.applicableDate,
      this.minTemp,
      this.maxTemp,
      this.theTemp,
      this.windSpeed,
      this.windDirection,
      this.airPressure,
      this.humidity,
      this.visibility,
      this.predictability});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weatherStateName = json['weather_state_name'];
    weatherStateAbbr = json['weather_state_abbr'];
    windDirectionCompass = json['wind_direction_compass'];
    created = json['created'];
    applicableDate = json['applicable_date'];
    minTemp = json['min_temp'];
    maxTemp = json['max_temp'];
    theTemp = json['the_temp'];
    windSpeed = json['wind_speed'];
    windDirection = json['wind_direction'];
    airPressure = json['air_pressure'];
    humidity = json['humidity'];
    visibility = json['visibility'];
    predictability = json['predictability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['weather_state_name'] = weatherStateName;
    data['weather_state_abbr'] = weatherStateAbbr;
    data['wind_direction_compass'] = windDirectionCompass;
    data['created'] = created;
    data['applicable_date'] = applicableDate;
    data['min_temp'] = minTemp;
    data['max_temp'] = maxTemp;
    data['the_temp'] = theTemp;
    data['wind_speed'] = windSpeed;
    data['wind_direction'] = windDirection;
    data['air_pressure'] = airPressure;
    data['humidity'] = humidity;
    data['visibility'] = visibility;
    data['predictability'] = predictability;
    return data;
  }
}
