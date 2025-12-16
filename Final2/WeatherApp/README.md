//
//  README.md
//  WeatherApp
//
//  Created by Аяулым Куат on 16.12.2025.
//

# News & Weather App

iOS application featuring top news headlines and weather forecasts.

## Features
- Browse top US news headlines
- View 5-day weather forecast
- Save favorite articles
- Customize app settings
- Pull to refresh content
- Beautiful responsive UI

## Requirements
- iOS 14.0+
- Xcode 13.0+
- Internet connection

## Installation

1. Clone this repository
2. Open `NewsWeatherApp.xcodeproj`
3. Update API keys in `NetworkManager.swift`:
   - News API: Get free key at https://newsapi.org
   - Weather API: Get free key at https://openweathermap.org
4. Build and run (Cmd+R)

## Dependencies
- Alamofire: Networking
- Kingfisher: Image loading

## Architecture
- MVC pattern
- Storyboard-based UI
- UserDefaults for local storage
- URLSession/Alamofire for networking

## Testing
Run tests: Cmd+U

## Author
Kuat Ayaulym

## License
Educational project for iOS Development course
