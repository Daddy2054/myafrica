//
//  VideoPlayerView.swift
//  myafrica
//
//  Created by Jean on 29/04/25.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {

    // MARK: - PROPERTIES
    var videoSelected: String
    var videoTitle: String

    @State private var player: AVPlayer?

    // MARK: - BODY
    var body: some View {
        VStack {
            if let player = player {
                VideoPlayer(player: player)
                    .onAppear {
                        player.play()
                        addLoopObserver(for: player)
                    }
                    .onDisappear {
                        player.pause()
                        removeLoopObserver()
                    }
                    .overlay(
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .padding(.top, 6)
                            .padding(.horizontal, 8),
                        alignment: .topLeading
                    )
            } else {
                ProgressView("Loading video...")
            }
        }
        .onAppear {
            if player == nil,
               let url = Bundle.main.url(forResource: videoSelected, withExtension: "mp4") {
                player = AVPlayer(url: url)
            }
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }

    // MARK: - LOOP HANDLER

    private func addLoopObserver(for player: AVPlayer) {
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { _ in
            player.seek(to: .zero)
            player.play()
        }
    }

    private func removeLoopObserver() {
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
}

