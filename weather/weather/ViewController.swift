//
//  ViewController.swift
//  weather
//
//  Created by 안재은 on 03/06/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    //let tempFormatter: NumberFormattor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherDataSource.shared.fetchSummary(lat: 37.498206, lon: 127.02761){
            [weak self] in
            self?.listTableView.reloadData()
        }
    }


}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.identifier, for: indexPath) as! SummaryTableViewCell
        
        if let data = WeatherDataSource.shared.summary?.weather.minutely.first {
            
            cell.weatherImageView.image = UIImage(named: data.sky.code)
            cell.stautsLabel.text = data.sky.name
            cell.minMaxLabel.text = "최대 \(data.temperature.tmax)º 최소 \(data.temperature.tmin)º"
            cell.currentTemperatureLabel.text = "\(data.temperature.tc)º"
        
        }
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
}
