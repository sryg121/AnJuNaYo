//
//  LocVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by ddd on 19/06/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class LocVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet var locPick: UIPickerView!
    
    @IBOutlet var locLabel: UILabel!
    
    @IBOutlet var setLoc: UIButton!
    
    var locArray = ["지역" ,"도선동", "사근동", "한양시장", "왕십리역 6번 출구"]
    var selectedRow = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locPick.delegate = self
        locPick.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {
            return locArray[0]
        } else if row == 1 {
            return locArray[1]
        } else if row == 2 {
            return locArray[2]
        } else if row == 3 {
            return locArray[3]
        } else {
            return locArray[4]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
        locLabel.text = locArray[selectedRow]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! SettingVC
        if selectedRow != 100 {
            dest.loc = locArray[selectedRow]
            UserDefaults.standard.set(locArray[selectedRow], forKey: "userLoc")
        } else {
            dest.loc = "지역"
            UserDefaults.standard.set("지역", forKey: "userLoc")
        }
    }

}
