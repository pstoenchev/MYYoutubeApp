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
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var appText: UITextView!
    
    
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
