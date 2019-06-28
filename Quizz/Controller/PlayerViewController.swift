//
//  PlayerViewController.swift
//  Quizz
//
//  Created by Mateus Filho on 26/06/19.
//  Copyright © 2019 Mateus Filho. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {


    @IBOutlet weak var labelTeste: UILabel!
    @IBOutlet weak var imgTeste: UIImageView!
    
    var player : SPTAudioStreamingController = SPTAudioStreamingController.sharedInstance()
    var session: SPTSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNewSession()
        labelTeste.text = self.player.metadata.currentTrack?.artistName
    }
    
   
    
    func handleNewSession() {
        if let session = session {
            self.player.delegate = self
            self.player.playbackDelegate = self
            self.player.login(withAccessToken: session.accessToken)
        }
    }
}

extension PlayerViewController: SPTAudioStreamingDelegate, SPTAudioStreamingPlaybackDelegate {
    func audioStreamingDidLogin(_ audioStreaming: SPTAudioStreamingController) {
        print("StreamingDidLogin Player")
        self.player.playSpotifyURI("spotify:track:2SFqE5mNkWXZfAcHSVhKAG", startingWith: 0, startingWithPosition: 40) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }
}
