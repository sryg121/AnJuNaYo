//
//  model.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 28/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation

struct WeatherSummary: Codable {
    
    struct Weather: Codable{
        struct Minutely: Codable{
            struct Sky: Codable {
                let code: String
                let name: String
            }
            struct Temperature: Codable {
                let tc: String
                let tmin: String
                let tmax: String
            }
            
            let sky: Sky
            let temperature: Temperature
        }
        let minutely: [Minutely]
    }
    
    struct Result: Codable{
        let code: Int
        let message: String
    }
    
    let weather: Weather
    let result: Result
}

class WeatherDataSource {
    static let shared = WeatherDataSource()
    
    var summary: WeatherSummary? // 현재 날씨 데이터 저장
    
    // 현재 날씨 파싱하는 메소드
    func fetchSummary(lat: Double, lon: Double, completion: @escaping () -> () ){
        
        
        let apiUrl = "https://api2.sktelecom.com/weather/current/minutely?version=1&lat=\(lat)&lon=\(lon)&appKey=\(appKey)"
        
        let url = URL(string: apiUrl)!
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            defer{
                DispatchQueue.main.async {
                    completion()
                }
            }
            
            if let error = error{
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print(httpResponse.statusCode)
                return
            }
            
            guard let data = data else {
                fatalError("Invalid data")
            }
            
            do{
                
                let decoder = JSONDecoder()
                self.summary = try decoder.decode(WeatherSummary.self, from: data) // 첫번째 파싱한 데이터 전달, 두번째 서버로 파싱한 데이터
                
                
            } catch{
                print(error)
            }
        }
        
        task.resume()
        
    }
    
    private init(){
        
    }
}
