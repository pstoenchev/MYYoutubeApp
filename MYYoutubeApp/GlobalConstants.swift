//
//  GlobalConsts.swift
//  MYYoutubeApp
//
//  Created by Mac on 27.10.20.
//  Copyright © 2020 Petar Stoenchev. All rights reserved.
//

import Foundation
// Use for constants.
struct GlobalConsts {
    
    static var API_KEY = "AIzaSyDIeikc5UshDEhiVNffBcrVsMAfKbiXgho"
    static var PLAYLIST_ID = "PL_8UJhFF15k5DiAHIzeSUFKDdPTyTrwCa"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(GlobalConsts.PLAYLIST_ID)&key=\(GlobalConsts.API_KEY)"
    static var VIDEO_CELL = "VideoCell"
    
    
}
