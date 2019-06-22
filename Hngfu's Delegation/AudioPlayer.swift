//
//  AudioPlayer.swift
//  Hngfu's Delegation
//
//  Created by 조재흥 on 19. 6. 22..
//  Copyright © 2019 hngfu. All rights reserved.
//

import AVFoundation

class AudioPlayer {
    
    private var player: AVAudioPlayer!
    
    func play(with name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3"),
            let player = try? AVAudioPlayer(contentsOf: url) else { return }
        self.player = player
        self.player.play()
    }
}
