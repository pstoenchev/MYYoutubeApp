//
//  Model.swift
//  MYYoutubeApp
//
//  Created by Mac on 28.10.20.
//  Copyright © 2020 Petar Stoenchev. All rights reserved.
//

import Foundation

//use protocol for method
protocol ModelDelegagate {
    
    func videoFetch(_ videos:[Video])
    
}

class Model  {
    
    var delegate: ModelDelegagate?
    
    // Mark: - get Videos from api Youtube.
    func getVideos() {
  
        
        guard let url =  URL(string: GlobalConsts.API_URL) else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response,
            error) in
            
            if error != nil || data == nil {
                return
            }
            do {
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    DispatchQueue.main.async {
                        self.delegate?.videoFetch(response.items!)
                    }
                }
                //Debug
                //     print(response.items?[2] ?? "ok")
            }
            catch {
                print("not okay")
            }
        }
        dataTask.resume()
        
    }
}
