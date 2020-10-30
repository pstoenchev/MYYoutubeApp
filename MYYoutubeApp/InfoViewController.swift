//
//  InfoViewController.swift
//  MYYoutubeApp
//
//  Created by Mac on 30.10.20.
//  Copyright © 2020 Petar Stoenchev. All rights reserved.
//

import UIKit
// MARK: - INFO FOR APP
final class InfoViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var appText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
}
//Mark: - change Color
extension InfoViewController {
    @IBAction func themeswitched(_ sender: UISwitch) {
        
        if sender.isOn == true {
            view.backgroundColor = UIColor.black
            label.textColor = .white
            appText.textColor = .white
            appText.backgroundColor = .black
           
        } else {
            view.backgroundColor = UIColor.white
            label.textColor = .black
            appText.textColor = .black
            appText.backgroundColor = .white
            
        }


       
       }
}
