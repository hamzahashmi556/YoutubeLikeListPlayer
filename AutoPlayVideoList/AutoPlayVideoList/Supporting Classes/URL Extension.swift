//
//  URL Extension.swift
//  AutoPlayVideoList
//
//  Created by Hamza Hashmi on 19/02/2024.
//

import Foundation
import AVFoundation
import UIKit

extension URL {
    
    func getThumbnailImage() throws -> UIImage {
        
        let asset = AVAsset(url: self)
        
        let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
        
        avAssetImageGenerator.appliesPreferredTrackTransform = true
        
        let thumnailTime = CMTimeMake(value: 2, timescale: 1)
        
        let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil)
        
        let thumbNailImage = UIImage(cgImage: cgThumbImage)
        
        return thumbNailImage
    }
}
