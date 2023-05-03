//
//  ViewController.swift
//  hoselines
//
//  Created by Spencer Longhurst on 5/1/23.
//

import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var HomeSingle: UIButton!
    @IBOutlet weak var HomeStep: UIButton!
    @IBOutlet weak var HomeDeck: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home!")
        
        HomeSingle.layer.cornerRadius = 10
        HomeStep.layer.cornerRadius = 10
        HomeDeck.layer.cornerRadius = 10
    }


}

