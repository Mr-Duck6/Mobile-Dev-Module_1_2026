import 'dart:math';

class WeatherService {
  Future<Map<String, dynamic>> fetchCurrentWeather(String city) async {
    if (city.trim().isEmpty) {
      throw ArgumentError('Місто не вказано');
    }

    await Future.delayed(const Duration(seconds: 2));

    return {'city': city, 'temp': 22, 'condition': 'Сонячно'};
  }

  Stream<int> temperatureUpdates({int times = 5}) async* {
    final random = Random();
    for (int i = 0; i < times; i++) {
      await Future.delayed(const Duration(seconds: 1));

      yield random.nextInt(16) + 15;
    }
  }
}

void main() async {
  final service = WeatherService();

  print('Перевірка fetchCurrentWeather');
  try {
    final weather = await service.fetchCurrentWeather('Київ');
    print(weather);
  } catch (e) {
    print('Помилка: $e');
  }

  print('\n Перевірка temperatureUpdates');
  await for (final temp in service.temperatureUpdates(times: 3)) {
    print('Температура: $temp°C');
  }
}
