//
//  SingleDiameterViewController.swift
//  hoselines
//
//  Created by Spencer Longhurst on 5/1/23.
//

import UIKit

class SingleDiameterViewController: UIViewController {

    @IBOutlet weak var SingleDiameterPicker: UIPickerView!
    
    var HoseDiameter = 1.50
    var HoseLength = 50.0
    
    let diameterSizes = ["1.5", "1.75", "2.5", "3", "4", "5" ]
    
    
    @IBOutlet weak var SingleLengthLabel: UILabel!
    @IBAction func SingleLengthStepper(_ sender: UIStepper) {
        SingleLengthLabel.text = String(sender.value)
        HoseLength = sender.value
        print(HoseLength)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Single!")
        
        SingleDiameterPicker.dataSource = self
        SingleDiameterPicker.delegate = self
    }
    
    


}

extension SingleDiameterViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return diameterSizes.count
    }
    
    
}

extension SingleDiameterViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(diameterSizes[row])
//        HoseDiameter = SingleDiameterPicker!
        return diameterSizes[row]

    }
    
}
