//
//  ViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import UIKit
import RoasterHammerShared

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let armyDTO = ArmyDTO(id: 1, name: "Test")
        print(armyDTO.name)
    }

    @IBAction func createAccountTapped(_ sender: Any) {
        // TODO: add navigation controller
        let createAccountViewController = CreateAccountViewController()
    }
    
}

