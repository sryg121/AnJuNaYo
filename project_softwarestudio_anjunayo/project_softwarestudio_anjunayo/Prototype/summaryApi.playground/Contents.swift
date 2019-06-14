import UIKit

//api 제대로 호출되는지 테스트용 playground
//호출된 데이터가 제대로 들어오는지 테스트

struct WeatherSummary: Codable {
    struct Weather: Codable{
        struct Minutely: Codable{
            struct Sky: Codable {
                let code: String
                let name: String
            }
            struct  Temperature: Codable {
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

var test: [String] = []
let sample = ["안뇽", "왜 안되는 걸까", "제발"]

let apiUrl = "https://api2.sktelecom.com/weather/current/minutely?version=1&lat=37.5633&lon=127.0371&appKey=2c08b3f7-61e6-4c48-bb1c-92a728633c26"
let url = URL(string: apiUrl)!

let session = URLSession.shared

let task = session.dataTask(with: url) { (data, response, error) in
    if let error = error{
        print(error)
        return
    }

    guard let httpResponse = response as? HTTPURLResponse else{
        print("Invalid respose")
        return
    }
    guard (200...299).contains(httpResponse.statusCode) else{
        print(httpResponse)
        return
    }
    guard let data = data else{
        fatalError("Invalid data")
    }
    do{
        let decoder = JSONDecoder()
        let summary = try decoder.decode(WeatherSummary.self, from: data)

        summary.result.code
        summary.result.message

        summary.weather.minutely.first?.sky.code
        summary.weather.minutely.first?.sky.name

        summary.weather.minutely.first?.temperature.tc
        summary.weather.minutely.first?.temperature.tmax
        summary.weather.minutely.first?.temperature.tmin

        if summary.weather.minutely.first?.sky.name == "구름많음" {
            print(true)
        }else {
            print(false)
        }
        if summary.weather.minutely.first?.sky.name == "맑음" {
            test = sample
            print(true)
            print(test)
        }else {
            print(false)
        }

    }catch{
        print(error)
    }
}

task.resume()


// 랜덤 수 생성 테스트
let num = arc4random_uniform(3)

print(num)

if num == UInt32(0) {
    print(0)
} else if num == UInt32(1) {
    print(1)
} else {
    print(2)
}



var test1 = "맑음"
var list: Array<Any>
var sample1 = ["안녕", "제발", "좀", "되라"]
if test1 == "맑음" {
    list = sample1
}
