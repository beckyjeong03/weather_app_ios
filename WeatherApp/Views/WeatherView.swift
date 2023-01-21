//
//  WeatherView.swift
//  WeatherApp
//
//  Created by 정선우 on 2023/01/21.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text (weather.name).bold().font(.title)
                    
                    Text("today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            VStack {
                HStack{
                    VStack(spacing:20){
                        Image(systemName: "sun.max")
                    }
                    Text(weather.main.feels_like.roundDouble()+"Degree")
                        .font(.system(size:100))
                        .fontWeight(.bold)
                        .padding()
                }
                
            }
            .frame(maxWidth: .infinity)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
