//
//  SingleDiameterViewController.swift
//  hoselines
//
//  Created by Spencer Longhurst on 5/1/23.
//

import UIKit

class SingleDiameterViewController: UIViewController {
    
    var HoseDiameter = 1.50
    var HoseLength = 50.0

    let diameterSizes = ["1.5", "1.75", "2.5", "3", "4", "5" ]
    let smoothTipSizes = ["1/2", "5/8", "3/4", "7/8", "15/16", "1", "1 1/8", "1 1/4", "1 3/8", "1 1/2", "1 3/4", "2", "2 1/4", "2 1/2", "2 3/4", "3"]

    @IBOutlet weak var SingleDiameterPicker: UIPickerView!
    @IBOutlet weak var SingleLengthLabel: UILabel!
    @IBAction func SingleLengthStepper(_ sender: UIStepper) {
        SingleLengthLabel.text = String(sender.value)
        HoseLength = sender.value
        print(HoseLength)
    }
    
    @IBOutlet weak var SingleSegment: UISegmentedControl!
    
    @IBAction func SingleSegmentAction(_ sender: UISegmentedControl) {
    }
    
    @IBOutlet weak var SingleSmoothPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Single!")
        
        SingleDiameterPicker.dataSource = self
        SingleDiameterPicker.delegate = self
        
        SingleSmoothPicker.dataSource = self
        SingleSmoothPicker.delegate = self
    }
    
    


}

extension SingleDiameterViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == SingleDiameterPicker {
            return diameterSizes.count
        } else if pickerView == SingleSmoothPicker {
            return smoothTipSizes.count
        } else {
            return diameterSizes.count
        }
    }
}

extension SingleDiameterViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == SingleDiameterPicker {
            return diameterSizes[row]
        } else if pickerView == SingleSmoothPicker {
            return smoothTipSizes[row]
        } else {
            return diameterSizes[row]
        }
    }
}
