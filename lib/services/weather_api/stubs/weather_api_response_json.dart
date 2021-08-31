const String weatherApiResponseJson = '''
{
    "name": "London",
    "clouds": {
        "all": 90
    },
    "wind": {
        "deg": 80,
        "speed": 4.1
    },
    "coord": {
        "lon": -0.13,
        "lat": 51.51
    },
    "visibility": 10000,
    "cod": 200,
    "weather": [
        {
            "icon": "09d",
            "description": "light intensity drizzle",
            "main": "Drizzle",
            "id": 300
        }
    ],
    "sys": {
        "sunset": 1485794875,
        "sunrise": 1485762037,
        "id": 5091,
        "type": 1,
        "message": 0.0103,
        "country": "GB"
    },
    "base": "stations",
    "id": 2643743,
    "main": {
        "humidity": 81,
        "temp": 23.32,
        "temp_max": 281.15,
        "pressure": 1012,
        "temp_min": 279.15
    },
    "dt": 1485789600
}
''';
