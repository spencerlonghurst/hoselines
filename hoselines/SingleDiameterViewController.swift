//
//  SingleDiameterViewController.swift
//  hoselines
//
//  Created by Spencer Longhurst on 5/1/23.
//

import UIKit

class SingleDiameterViewController: UIViewController {
    
    var HoseLength = 50
    var GPM = 100
    var hoseSize = 1.5
    var FLCoefficent = 2.0

    let diameterSizes = ["1.5", "1.75", "2.5", "3", "4", "5" ]
    let smoothTipSizes = ["1/2", "5/8", "3/4", "7/8", "15/16", "1", "1 1/8", "1 1/4", "1 3/8", "1 1/2", "1 3/4", "2", "2 1/4", "2 1/2", "2 3/4", "3"]
    
    
    
    
    
    

    @IBOutlet weak var SingleDiameterPicker: UIPickerView!
    @IBOutlet weak var SingleLengthLabel: UILabel!
    @IBAction func SingleLengthStepper(_ sender: UIStepper) {
        HoseLength = Int(sender.value)
        SingleLengthLabel.text = "\(Int(sender.value)) Feet"

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
    

    
    @IBOutlet weak var SinglePressureLabel: UILabel!
    @IBAction func SinglePressureStepper(_ sender: UIStepper) {
        SinglePressureLabel.text = "\(Int(sender.value)) PSI"
    }
    
    
    @IBOutlet weak var SingleGPMLabel: UILabel!
    
    @IBAction func SingleGPMStepper(_ sender: UIStepper) {
        GPM = Int(sender.value)
        SingleGPMLabel.text = "\(Int(sender.value)) GPM"
    }
    
    @IBOutlet weak var SingleElevationLabel: UILabel!
    
    @IBAction func SingleElevationStepper(_ sender: UIStepper) {
        SingleElevationLabel.text = "\(Int(sender.value)) Feet"
    }
    
    
    @IBOutlet weak var FrictionLoss: UILabel!
    
    
    @IBOutlet weak var PumpPressure: UILabel!
    
    @IBAction func FrictionLossButton(_ sender: UIButton) {
        func frictionLoss(coefficent: Double, flowRate: Double, hoseLength: Double){
//            let FL = coefficent + flowRate + hoseLength
            let A = coefficent
            let B = ((flowRate/100)*(flowRate/100))
            let C = (hoseLength/100)
            let FL = Int(A * B * C)
            FrictionLoss.text = "\(FL) PSI Loss"
        }
        
        if hoseSize == 1.5 {
            FLCoefficent = 24
        } else if hoseSize == 1.75 {
            FLCoefficent = 15.5
        } else if hoseSize == 2.5 {
            FLCoefficent = 2
        } else if hoseSize == 3 {
            FLCoefficent = 0.677
        } else if hoseSize == 4 {
            FLCoefficent = 0.2
        } else if hoseSize == 5 {
            FLCoefficent = 0.08
        }
        
        frictionLoss(coefficent: FLCoefficent, flowRate: Double(GPM), hoseLength: Double(HoseLength))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            hoseSize = Double(diameterSizes[row])!
            return diameterSizes[row]
        } else if pickerView == SingleSmoothPicker {
            return smoothTipSizes[row]
        } else {
            return diameterSizes[row]
        }
    }
}
