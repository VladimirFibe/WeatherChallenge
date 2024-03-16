//
//  API.swift
//  WeatherChallenge
//
//  Created by Vladimir Fibe on 16.03.2024.
//

import Foundation

final class APIManager {
    private let apiKey = "46958494d92dddd02f6d0e45932fa84f"

    func load(completion: @escaping (Weather) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=\(apiKey)") else { return }

        let session = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            guard let data, let weather = try? JSONDecoder().decode(Weather.self, from: data) else { return }
            completion(weather)
        }
        session.resume()
    }
}
