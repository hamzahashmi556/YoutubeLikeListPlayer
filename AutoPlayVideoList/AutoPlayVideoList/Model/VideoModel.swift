//
//  VideoModel.swift
//  AutoPlayVideoList
//
//  Created by Hamza Hashmi on 19/02/2024.
//

import Foundation

struct VideoModel: Identifiable {
    var id = UUID().uuidString
    var videoURL: URL
}
