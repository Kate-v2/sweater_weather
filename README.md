This app is deployed at https://sweater-weather-api-app.herokuapp.com/

The landing page has information about how to hit each JSON endpoint.




# README

# Technologies
Ruby Version: 2.4.1
Rails Version: 5.2.2

### Gems:
#### Production
* pg
* puma
* sass-rails
* uglifier
* mini_racer
* coffee-rails
* jbuilder
* redis
* bcrypt
* mini_magick
* capistrano-rails
* bootsnap
* figaro
* faraday
* fast_jsonapi
* factory_bot_rails
* faker
* geocode
* city-state
#### Test / Dev
* byebug
* rspec-rails
* pry
* simplecov
* capybara


### Test Suite: 
* RSpec

### Endpoints:
* GET https://sweater-weather-api-app.herokuapp.com/api/v1/forecasts?location=denver,co
* GET https://sweater-weather-api-app.herokuapp.com/api/v1/gifs?location=denver,co
* POST https://sweater-weather-api-app.herokuapp.com/api/v1/users
* POST https://sweater-weather-api-app.herokuapp.com/api/v1/sessions
* GET / POST / DELETE https://sweater-weather-api-app.herokuapp.com/api/v1/favorites 

#### Forecast
/api/v1/forecasts?location=CITY,STATE
```
--- Request ---
GET https://sweater-weather-api-app.herokuapp.com/api/v1/forecasts?location=denver,co

Content-Type: application/json 
Accept: application/json 
```
```
--- Response ---
{
    "data": {
        "id": "0",
        "type": "forecast_endpoint",
        "attributes": {
            "id": 0,
            "current": {
                "time": 1548698416,
                "summary": "Light Snow",
                "icon": "snow",
                "temperature": 21.88,
                "feels_like": 21.88
            },
            "today": {
                "time": 1548745200,
                "summary": "Partly cloudy until afternoon.",
                "icon": "partly-cloudy-day",
                "low": 16.44,
                "high": 33.89,
                "humidity": 0.54,
                "visibility": 10,
                "uv_index": 3
            },
            "forecast": {
                "data": {
                    "id": "0",
                    "type": "forecast",
                    "attributes": {
                        "id": 0,
                        "hourly": [
                            {
                                "time": 1548698400,
                                "icon": "snow",
                                "temperature": 21.87
                            },
                            ...
                            + 48 more
                            ...
                        ],
                        "days": [
                            {
                                "time": 1548658800,
                                "icon": "snow",
                                "summary": "Light snow (< 1 in.) until afternoon.",
                                "precip_probability": 0.31,
                                "precip_type": "snow",
                                "low": 13.31,
                                "high": 29.19
                            },
                            {
                                "time": 1548745200,
                                "icon": "partly-cloudy-day",
                                "summary": "Partly cloudy until afternoon.",
                                "precip_probability": 0.06,
                                "precip_type": "snow",
                                "low": 16.44,
                                "high": 33.89
                            },
                            ...
                            + 6 more (note: 1st is 'yesterday', 2nd is 'today')
                            ...
                        ]
                    }
                }
            },
            "location": {
                "city": {
                    "long_name": "Denver",
                    "short_name": "Denver"
                },
                "state": {
                    "long_name": "Colorado",
                    "short_name": "CO"
                },
                "country": {
                    "long_name": "United States",
                    "short_name": "US"
                }
            }
        }
    }
}
```

#### Gifs
api/v1/gifs?location=CITY,STATE
```
--- Request ---
GET https://sweater-weather-api-app.herokuapp.com/api/v1/gifs?location=denver,co

Content-Type: application/json 
Accept: application/json
```
```
--- Response ---
{
    "data": {
        "id": "0",
        "type": "forecast_gifs",
        "attributes": {
            "id": 0,
            "daily_gifs": [
                {
                    "url": "https://giphy.com/gifs/snow-winter-christmas-light-13P9fSyHMKVJ1S",
                    "time": 1548658800,
                    "summary": "Light snow (< 1 in.) until afternoon."
                },
                ...
                + 7 more
                ...
            ],
            "copyright": 2019
        }
    }
}
```

#### New User
/api/v1/users
```
--- Request ---
POST https://sweater-weather-api-app.herokuapp.com/api/v1/users

Content-Type: application/json 
Accept: application/json 
Body: 
{ 
  'email': 'whatever@example.com', 
  'password': 'password', 
  'password_confirmation': 'password' 
}
```
```
--- Response ---
{
    "data": {
        "id": "1",
        "type": "new_user",
        "attributes": {
            "api_key": "5RDihigIH6DrOzaF7n9u5g=="
        }
    }
}
```

#### Login
/api/v1/sessions
```
--- Request ---
POST https://sweater-weather-api-app.herokuapp.com/api/v1/sessions

Content-Type: application/json 
Accept: application/json 
Body: 
{ 
  'email': 'whatever@example.com', 
  'password': 'password', 
}
```
```
--- Response ---
{
    "data": {
        "id": "1",
        "type": "login",
        "attributes": {
            "id": 1,
            "api_key": "5RDihigIH6DrOzaF7n9u5g=="
        }
    }
}
```

#### Add Favorite
/api/v1/favorites
```
--- Request ---
POST https://sweater-weather-api-app.herokuapp.com/api/v1/favorites

Content-Type: application/json 
Accept: application/json 
Body: 
{ 
  'location': 'Denver, CO', 
  'api_key': '5RDihigIH6DrOzaF7n9u5g==', 
}
```
```
--- Response ---
none
```

#### See Favorites
/api/v1/favorites
```
--- Request ---
GET https://sweater-weather-api-app.herokuapp.com/api/v1/favorites

Content-Type: application/json 
Accept: application/json 
Body: 
{ 
  'api_key': '5RDihigIH6DrOzaF7n9u5g==', 
}
```
```
--- Response ---
{
    "data": [
        {
            "id": "0",
            "type": "user_favorites",
            "attributes": {
                "location": "Denver,CO",
                "current_weather": {
                    "data": {
                        "time": 1548701191,
                        "summary": "Light Snow",
                        "icon": "snow",
                        "nearestStormDistance": 0,
                        "precipIntensity": 0.007,
                        "precipIntensityError": 0.002,
                        "precipProbability": 0.97,
                        "precipType": "snow",
                        "temperature": 23.88,
                        "apparentTemperature": 19.02,
                        "dewPoint": 18.2,
                        "humidity": 0.79,
                        "pressure": 1026.39,
                        "windSpeed": 3.75,
                        "windGust": 7.08,
                        "windBearing": 124,
                        "cloudCover": 0.93,
                        "uvIndex": 2,
                        "visibility": 2.17,
                        "ozone": 306.37
                    },
                    "time": 1548701191,
                    "summary": "Light Snow",
                    "icon": "snow",
                    "temperature": 23.88,
                    "feels_like": 19.02
                }
            }
        }
    ]
    ...
    + additional favorite locations with forecast
    ...
}

```

#### Remove Favorite
/api/v1/favorites
```
--- Request ---
DELETE https://sweater-weather-api-app.herokuapp.com/api/v1/favorites

Content-Type: application/json 
Accept: application/json 
Body: 
{ 
  'location': 'Denver, CO', 
  'api_key': '5RDihigIH6DrOzaF7n9u5g==', 
}
```
```
--- Response ---
none
```

