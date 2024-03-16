//
//  Weather.swift
//  WeatherChallenge
//
//  Created by Vladimir Fibe on 16.03.2024.
//

import Foundation

struct Weather: Codable {
    let main: Main
}

struct Main: Codable {
    let temp: Double
 }
