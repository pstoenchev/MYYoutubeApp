//
//  CacheManager.swift
//  MYYoutubeApp
//
//  Created by Mac on 29.10.20.
//  Copyright © 2020 Petar Stoenchev. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCell(_ url: String, _ data:Data?) {
        
        cache[url] = data
    }
    
    static func getVidoChache(_ url:String) -> Data? {
        
        return cache[url]
    }
}
