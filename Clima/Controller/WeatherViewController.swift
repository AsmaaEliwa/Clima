//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
class WeatherViewController: UIViewController,UITextFieldDelegate {
    var locatinManager = CLLocationManager()
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    var wetherManager = WetherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
     
        // Do any additional setup after loading the view.
    }
    @IBAction func searchButtonPressed(_ sender: UIButton) {
//        print(searchTextField.text)
        searchTextField.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print(searchTextField.text)
        wetherManager.getTemp(city: searchTextField.text ?? "") { temp in
//            print(temp?.main.humidity)
            DispatchQueue.main.async{
                self.temperatureLabel.text = String(temp?.main.humidity ?? 0)
                self.cityLabel.text = String(temp?.name ?? "")
               let image = self.getImageName(conditionID: temp?.weather[0].id ?? 220)
                self.conditionImageView.image = UIImage(systemName: image )
            }
        }
        searchTextField.endEditing(true)
        
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else{
            searchTextField.text = "Write Something"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
    func getImageName(conditionID:Int)->String{
        switch conditionID {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }

    }
}

