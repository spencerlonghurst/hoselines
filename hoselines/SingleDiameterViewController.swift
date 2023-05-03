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
        switch SingleSegment.selectedSegmentIndex
        {
        case 0:
            SingleSmoothPicker.isUserInteractionEnabled = true
            SingleSmoothPicker.alpha = 1
            SingleSmoothLabel.alpha = 1
        case 1:
            SingleSmoothPicker.isUserInteractionEnabled = false
            SingleSmoothPicker.alpha = 0.5
            SingleSmoothLabel.alpha = 0.5
        default:
            break
        }
        
        
    }
    
    @IBOutlet weak var SingleSmoothLabel: UILabel!
    @IBOutlet weak var SingleSmoothPicker: UIPickerView!
    

    let potato = 0
    
    @IBOutlet weak var SinglePressureLabel: UILabel!
    @IBAction func SinglePressureStepper(_ sender: UIStepper) {
        SinglePressureLabel.text = String(sender.value)
    }
    
    
    @IBOutlet weak var SingleGPMLabel: UILabel!
    
    @IBAction func SingleGPMStepper(_ sender: UIStepper) {
        SingleGPMLabel.text = String(sender.value)
    }
    
    @IBOutlet weak var SingleElevationLabel: UILabel!
    
    @IBAction func SingleElevationStepper(_ sender: UIStepper) {
        SingleElevationLabel.text = String(sender.value)
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Single!")
        
        SingleDiameterPicker.dataSource = self
        SingleDiameterPicker.delegate = self
        
        SingleSmoothPicker.dataSource = self
        SingleSmoothPicker.delegate = self
        
        SinglePressureLabel.text = "75"
        SingleGPMLabel.text = "100"
        
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
