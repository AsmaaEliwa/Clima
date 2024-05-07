//
//  WetherModel.swift
//  Clima
//
//  Created by asmaa gamal  on 06/05/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
struct WetherModel:Codable{
    let main:MainModel
    let name:String
    let weather:[Weather]
    let coord:Coordinates
}
struct MainModel:Codable{
    let temp:Float
    let temp_min:Float
    let temp_max:Float
    let humidity:Int
}
struct Weather:Codable{
    let id:Int
}
struct Coordinates:Codable{
    let lon: Double
    let lat: Double
}
