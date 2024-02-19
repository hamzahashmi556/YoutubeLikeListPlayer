//
//  Constants.swift
//  AutoPlayVideoList
//
//  Created by Hamza Hashmi on 19/02/2024.
//

import Foundation

final class Constants {
    
    private init() {}
    
    static private let videoURLs: [String] = [
        "pexels_videos_1966695 (1080p)",
        "pexels-rodolfo-angulo-a-6247699 (1080p)",
        "pexels-shalender-kumar-6575012 (2160p)",
        "production_id_3833491 (1080p)",
        "production_id_4713259 (1080p)",
        "production_id_4872339 (1080p)"
    ]
    
    static func getVideos() -> [VideoModel] {
        
        var videoModels: [VideoModel] = []
        
        for videoURL in videoURLs {
            
            if let localURL = Bundle.main.url(forResource: videoURL, withExtension: "mp4") {
                
                let model = VideoModel(videoURL: localURL)
                
                videoModels.append(model)
            }
        }
        
        return videoModels
    }
}
