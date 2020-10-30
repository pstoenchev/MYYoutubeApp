//
//  SecondViewController.swift
//  MYYoutubeApp
//
//  Created by Mac on 29.10.20.
//  Copyright © 2020 Petar Stoenchev. All rights reserved.
//

import UIKit
import WebKit
/// MARK: - you can see vide clip
class SecondViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
// logic for video clip date, vio, label for info
extension SecondViewController {
    
    override func viewWillAppear(_ animated: Bool) {
         titleLabel.text = ""
         dateLabel.text = ""
         textView.text = ""
         
         guard video != nil else { return }
         //Mark: - youtube URL,
         let url = "https://www.youtube.com/embed/"
         let embededUrl = url + video!.videoId
         let parseUrl = URL(string: embededUrl)
         let request = URLRequest(url: parseUrl!)
         webView.load(request)
         
         titleLabel.text = video?.title
         // set date on label
         let dateF = DateFormatter()
         dateF.dateFormat = "MM-dd-yyyy"
         dateLabel.text = dateF.string(from: video!.published)
         textView.text = video?.description
         
     }
     
}
