//
//  SingleDiameterViewController.swift
//  hoselines
//
//  Created by Spencer Longhurst on 5/1/23.
//

import UIKit
import Foundation

class SingleDiameterViewController: UIViewController {
    
    var HoseLength = 50
    var GPM = 100
    var hoseSize = 1.5
    var FLCoefficent = 2.0
    var smoothBoreSize = "1/2"
    var smoothBoreSizeDouble = 0.0
    var nozzlePressure = 75
    var FrictionLossInt = 0
    var ElevationFeet = 5.0

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
            SingleGPMStepperOutlet.isUserInteractionEnabled = false
            SingleGPMStepperOutlet.alpha = 0
            SingleGPMButtonOutlet.isUserInteractionEnabled = true
            SingleGPMButtonOutlet.alpha = 1
        case 1:
            SingleSmoothPicker.isUserInteractionEnabled = false
            SingleSmoothPicker.alpha = 0.5
            SingleSmoothLabel.alpha = 0.5
            SingleGPMStepperOutlet.isUserInteractionEnabled = true
            SingleGPMStepperOutlet.alpha = 1
            SingleGPMButtonOutlet.isUserInteractionEnabled = false
            SingleGPMButtonOutlet.alpha = 0
        default:
            break
        }
    }
    
    @IBOutlet weak var SingleSmoothLabel: UILabel!
    @IBOutlet weak var SingleSmoothPicker: UIPickerView!
    
    @IBOutlet weak var SinglePressureLabel: UILabel!
    @IBAction func SinglePressureStepper(_ sender: UIStepper) {
        nozzlePressure = Int(sender.value)
        SinglePressureLabel.text = "\(Int(sender.value)) PSI"
    }
    
    @IBOutlet weak var SingleGPMLabel: UILabel!
    
    @IBOutlet weak var SingleGPMStepperOutlet: UIStepper!
    @IBAction func SingleGPMStepper(_ sender: UIStepper) {
        GPM = Int(sender.value)
        SingleGPMLabel.text = "\(Int(sender.value)) GPM"
    }
    
    @IBAction func SingleGPMButton(_ sender: UIButton) {
        
        if smoothBoreSize == "1/2" {
            smoothBoreSizeDouble = 0.5
        } else if smoothBoreSize == "5/8" {
            smoothBoreSizeDouble = 0.625
        } else if smoothBoreSize == "3/4" {
            smoothBoreSizeDouble = 0.75
        } else if smoothBoreSize == "7/8" {
            smoothBoreSizeDouble = 0.875
        } else if smoothBoreSize == "15/16" {
            smoothBoreSizeDouble = 0.9375
        } else if smoothBoreSize == "1" {
            smoothBoreSizeDouble = 1.0
        } else if smoothBoreSize == "1 1/8" {
            smoothBoreSizeDouble = 1.125
        } else if smoothBoreSize == "1 1/4" {
            smoothBoreSizeDouble = 1.25
        } else if smoothBoreSize == "1 3/8" {
            smoothBoreSizeDouble = 1.375
        } else if smoothBoreSize == "1 1/2" {
            smoothBoreSizeDouble = 1.5
        } else if smoothBoreSize == "1 3/4" {
            smoothBoreSizeDouble = 1.75
        } else if smoothBoreSize == "2" {
            smoothBoreSizeDouble = 2.0
        } else if smoothBoreSize == "2 1/4" {
            smoothBoreSizeDouble = 2.25
        } else if smoothBoreSize == "2.1/2" {
            smoothBoreSizeDouble = 2.5
        } else if smoothBoreSize == "2 3/4" {
            smoothBoreSizeDouble = 2.75
        } else if smoothBoreSize == "3" {
            smoothBoreSizeDouble = 3.0
        }
        
        func gpm(diameter: Double, pressure: Double){

            let A = 29.7
            let B = (diameter*diameter)
            let C = sqrt(pressure)
            let GallonsPer = Int(A * B * C)
            SingleGPMLabel.text = "\(GallonsPer) GPM"
        }
        
        
        
        gpm(diameter: smoothBoreSizeDouble, pressure: Double(nozzlePressure))
    }
    
    @IBOutlet weak var SingleGPMButtonOutlet: UIButton!
    
    @IBOutlet weak var SingleElevationLabel: UILabel!
    
    @IBAction func SingleElevationStepper(_ sender: UIStepper) {
        ElevationFeet = (sender.value)
        SingleElevationLabel.text = "\(Int(sender.value)) Feet"
    }
    
    @IBOutlet weak var FrictionLoss: UILabel!
    
    @IBAction func FrictionLossButton(_ sender: UIButton) {
        func frictionLoss(coefficent: Double, flowRate: Double, hoseLength: Double){
            WarningMessage.text = ""

            let A = coefficent
            let B = ((flowRate/100)*(flowRate/100))
            let C = (hoseLength/100)
            var FL = Int(A * B * C)
            FrictionLossInt = FL
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
        
        PumpPressureButtonOutlet.isUserInteractionEnabled = true
        PumpPressureButtonOutlet.alpha = 1
    }
    
    @IBOutlet weak var PumpPressureLabel: UILabel!
    @IBOutlet weak var PumpPressureButtonOutlet: UIButton!
    @IBAction func PumpPressureButton(_ sender: UIButton) {
        if PumpPressureButtonOutlet.alpha == 0.5 {
            WarningMessage.text = "You need to find out the Friction Loss first"
        } else {
            WarningMessage.text = ""
            
            let EL = 0.5 * ElevationFeet
            
            let PDP = Int(Double(nozzlePressure) + Double(FrictionLossInt) + EL)
            FrictionLoss.text = "\(FrictionLossInt) PSI Loss"
            PumpPressureLabel.text = "\(PDP) PSI Loss"
            
            PumpPressureButtonOutlet.alpha = 0.5
        }
    }
    
    @IBOutlet weak var WarningMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SingleDiameterPicker.dataSource = self
        SingleDiameterPicker.delegate = self
        
        SingleSmoothPicker.dataSource = self
        SingleSmoothPicker.delegate = self
        
        SingleGPMStepperOutlet.isUserInteractionEnabled = false
        SingleGPMStepperOutlet.alpha = 0
        
        SingleGPMButtonOutlet.isUserInteractionEnabled = true
        SingleGPMButtonOutlet.alpha = 1.0
        
        PumpPressureButtonOutlet.alpha = 0.5
        
        WarningMessage.text = ""
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
            smoothBoreSize = smoothTipSizes[row]
            return smoothTipSizes[row]
        } else {
            return diameterSizes[row]
        }
    }
}
