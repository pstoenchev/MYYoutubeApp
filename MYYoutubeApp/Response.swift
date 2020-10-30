//
//  Response.swift
//  MYYoutubeApp
//
//  Created by Mac on 28.10.20.
//  Copyright © 2020 Petar Stoenchev. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try
            decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([Video].self, forKey: .items)
        
    }
}
