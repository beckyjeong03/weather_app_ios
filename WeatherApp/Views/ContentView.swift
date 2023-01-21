//
//  ContentView.swift
//  WeatherApp
//
//  Created by 정선우 on 2023/01/19.
//

import SwiftUI

struct ContentView: View {
    // Replace YOUR_API_KEY in WeatherManager with your own API key for the app to work
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?

    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    Text("Weather data fetched!  ")
                    
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await
                                weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            }catch{
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else{
                    if locationManager.isLoading {
                        LoadingView()
                    }else {
                        WelcomeView().environmentObject (locationManager)
                    }
                }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
