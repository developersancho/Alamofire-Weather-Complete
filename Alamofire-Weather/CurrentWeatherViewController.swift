//
//  CurrentWeatherViewController.swift
//  Alamofire-Weather
//
//  Created by Duc Tran on 6/11/17.
//  Copyright © 2017 Duc Tran. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    
    let forecastAPIKey = "33c371344898311931ea3058dcc4730f"
    let coordinate: (lat: Double, long: Double) = (41.013930,28.983576)
    var forecastService: ForecastService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
                if let currentWeather = currentWeather {
                    DispatchQueue.main.async {
                        if let temperature = currentWeather.temperature {
                            self.temperatureLabel.text = "\(temperature)°"
                        } else {
                            self.temperatureLabel.text = "-"
                        }
                    }
                }
        }

    }


}















