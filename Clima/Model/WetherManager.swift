//
//  WetherManager.swift
//  Clima
//
//  Created by asmaa gamal  on 06/05/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
class WetherManager{
    func getRequest(url:String ,compelation:@escaping(_ data:Data?)->Void){
        guard let requestUrl = URL(string:url)else{return}
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        
        
        let task = URLSession.shared.dataTask(with: request){data,response , error in
            
            if data != nil {
                compelation(data!)
            }else{
                compelation(nil)
            }
        }
        task.resume()
    }
    
    func getTemp(city:String ,completaion:@escaping(WetherModel?)->Void){
        let url = "https://api.openweathermap.org/data/2.5/weather?appid=89d9cb151868cee3a37d321a18f40bce&q=\(city)"
        let decoder = JSONDecoder()
        getRequest(url: url) { data in
            if let jsonData = data {
                do {
                    let result = try decoder.decode(WetherModel.self, from:jsonData )
                    completaion( result)
                }catch{
                    print(error)
                    completaion( nil)
                }
            }
        }
    }
}
