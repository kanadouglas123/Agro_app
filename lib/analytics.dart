import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Analytics());
}

class Analytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather forecast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage>
    with SingleTickerProviderStateMixin {
  String cityName = '';
  String weatherDescription = '';
  double temperature = 0;
  late AnimationController _controller;
  late Animation<Color?> _backgroundColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
    _backgroundColor = ColorTween(
      begin: Colors.blue[200],
      end: Colors.blue[400],
    ).animate(_controller);
  }

  Future<void> fetchWeatherData(String city) async {
    const apiKey = 'b13b3976c213bb7b1b9b3be6ec9469ac'; // Replace with your API key
    final apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        cityName = jsonData['name'];
        weatherDescription = jsonData['weather'][0]['description'];
        temperature = jsonData['main']['temp'];
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Widget _buildWeatherIllustration() {
    if (weatherDescription.toLowerCase().contains('rain')) {
      return Image.asset('assets/rain.png', height: 100);
    } else if (weatherDescription.toLowerCase().contains('sun')) {
      return Image.asset('assets/sun.png', height: 100);
    } else {
      return Image.asset('assets/cloud.png', height: 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather forecast'),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _backgroundColor.value!,
                  Colors.white,
                ],
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset:const Offset(0, 5),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          _buildWeatherIllustration(),
                          const SizedBox(height: 10),
                          Text(
                            '$cityName',
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Weather: $weatherDescription',
                            style: const TextStyle(fontSize: 20),
                          ),
                         const  SizedBox(height: 10),
                          Text(
                            'Temperature: $temperature°C',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                   const  SizedBox(height: 20),
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter city name',
                        labelText: 'City',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        cityName = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        fetchWeatherData(cityName);
                      },
                      child: const Text('Get Weather'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
