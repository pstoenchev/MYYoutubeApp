//
//  ViewController.swift
//  MYYoutubeApp
//
//  Created by Mac on 27.10.20.
//  Copyright © 2020 Petar Stoenchev. All rights reserved.
//

import UIKit


//Mark - Start point app.
 final class ViewController: UIViewController {

    //Mark - Table View
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var spinner: UIActivityIndicatorView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
    
        tableView.tableFooterView = UIView()
        
        super.viewDidLoad()
        self.title = "Drift channel!"
        // Do any additional setup after loading the view.
        model.getVideos()
        model.delegate = self
        spinner.startAnimating()
    }
}

// Mark: - Table view implementation.

extension ViewController: UITableViewDataSource {
    // count of cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         videos.count
    }
    // give info for table view.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GlobalConsts.VIDEO_CELL, for: indexPath) as!
        YouTubeVideoTableViewCell
        let video = self.videos[indexPath.row]
        cell.setVideoCell(video)
        spinner.stopAnimating()
        return cell
    }
}
// for tab and deselect on table view.
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
        UIPasteboard.general.string = videos[0].title
            
    }
}
// get video.
extension ViewController: ModelDelegagate {
    func videoFetch(_ videos: [Video]) {
        
        self.videos = videos
        tableView.reloadData()
        spinner.stopAnimating()
    }
    
    /// For error in app give this function, who give 1 alert.
     func popUp() {
        let alert = UIAlertController(title: "OOps have a problem.", message: "Try again", preferredStyle: .alert)
        alert.addAction(.init(title: "ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
}
extension ViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard tableView.indexPathForSelectedRow != nil   else { return   popUp() }
        
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        let destination = segue.destination as? SecondViewController
        destination?.video = selectedVideo
    }
}
