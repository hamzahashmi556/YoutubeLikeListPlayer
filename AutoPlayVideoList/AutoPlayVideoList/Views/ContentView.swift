//
//  ContentView.swift
//  AutoPlayVideoList
//
//  Created by Hamza Hashmi on 04/02/2024.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State var videos = Constants.getVideos()
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                ForEach(videos) { video in
                    
                    GeometryReader { reader in
                                    
                        let range = 50.0...290
                        
                        let isVisible = range ~= reader.frame(in: .global).midY
                        
                        if isVisible {
                            VideoPlayerView(isPlaying: true, url: video.videoURL)
                        }
                        else {
                            VideoPlayerView(isPlaying: false, url: video.videoURL)
                        }
                        
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 240, alignment: .center)
                    .background(.black)
                }
            }
            .padding(.bottom, 500)
        }
    }
}


struct VideoPlayerView: UIViewControllerRepresentable {
    
    var isPlaying: Bool
    
    @State var url: URL
    
    func makeUIViewController(context: Context) -> some AVPlayerViewController {
        
        let vc = AVPlayerViewController()
        
        vc.videoGravity = .resizeAspectFill
        
        vc.showsPlaybackControls = true
        
        vc.showsTimecodes = false
        
        let player = AVPlayer(url: url)

        vc.player = player

        if isPlaying {
            player.play()
        }
        else {
            player.pause()
        }
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//        if isVisible {
//            self.isPlaying = true
//        }

//        if self.isPlaying {
//            self.player.play()
//        }
//        else {
//            self.player.pause()
//        }
    }
}

#Preview {
//    ContentView()
//    let player = AVPlayer.init(url: URL(string: "https://www.pexels.com/download/video/4713259/?h=1080&w=1920")!)
//    
//    
//    return VideoPlayerVC()
////    return VideoPlayer(player: player)
//        .frame(height: 240)
        ContentView()

}
