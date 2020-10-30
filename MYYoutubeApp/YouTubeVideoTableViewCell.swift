//
//  YouTubeVideoTableViewCell.swift
//  MYYoutubeApp
//
//  Created by Mac on 28.10.20.
//  Copyright © 2020 Petar Stoenchev. All rights reserved.
//

import UIKit

class YouTubeVideoTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var videoImage: UIImageView!
    @IBOutlet private weak var nameVideoLabel: UILabel!
    @IBOutlet private weak var dateVideoLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
        
    }
    func setVideoCell(_ vi: Video) {
        self.video = vi
        nameVideoLabel.text =  video?.title
        let datef = DateFormatter()
        datef.dateFormat = "MM-dd-yyyy"
        
        dateVideoLabel.text = datef.string(from: video!.published)
        
        
        guard self.video!.thumbnail != "" else {
            return
        }
        
        if let cachedData =
            CacheManager.getVidoChache(self.video!.thumbnail) {
            
            //
            self.videoImage.image = UIImage(data: cachedData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                CacheManager.setVideoCell(url!.absoluteString, data!)
                
                CacheManager.setVideoCell(url!.absoluteString, data)
                
                if url!.absoluteString != self.video?.thumbnail {
                    
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.videoImage.image = image
                }
            }
        }
        
        dataTask.resume()
    }
}
