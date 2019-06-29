//
//  ViewController.swift
//  Quizz
//
//  Created by Mateus Filho on 31/05/19.
//  Copyright © 2019 Mateus Filho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var auth = SPTAuth.defaultInstance()
    var session: SPTSession!

    @IBOutlet weak var btComecar: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        btComecar.layer.cornerRadius = 10
    }
    
    @IBAction func comecar(_ sender: Any) {
        
        btComecar.isHidden = false

        NotificationCenter.default.addObserver(self, selector: #selector(receievedUrlFromSpotify), name: NSNotification.Name.Spotify.authURLOpened, object: nil)
        
        //Check to see if the user has Spotify installed
        if SPTAuth.supportsApplicationAuthentication() {
            //Open the Spotify app by opening its url
            let appURL = SPTAuth.defaultInstance().spotifyAppAuthenticationURL()
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        } else {
            let webURL = SPTAuth.defaultInstance().spotifyWebAuthenticationURL()
            //Present a web browser in the app that lets the user sign in to Spotify
            UIApplication.shared.open(webURL, options: [:]) { (_) in
                if self.auth.canHandle(self.auth.redirectURL!) {
                    // Url is automatically open in mobile default web browser
                }
            }
        }
    }
    
    @objc func receievedUrlFromSpotify(_ notification: Notification) {
        guard let url = notification.object as? URL else { return }
        // Remove the observer from the Notification Center
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.Spotify.authURLOpened,
                                                  object: nil)
        
        SPTAuth.defaultInstance().handleAuthCallback(withTriggeredAuthURL: url) { (error, session) in
            if let error = error {
                // Pass our error onto another method which will determine how to show it
                self.displayErrorMessage(error: error)
                return
            }
            
            if let session = session {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "segueLogin", sender: session)
                }
            }
        }
    }
    
    
    func displayErrorMessage(error: Error) {
        // When changing the UI, all actions must be done on the main thread,
        // since this can be called from a notification which doesn't run on
        // the main thread, we must add this code to the main thread's queue
        btComecar.isHidden = true
        
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error",
                                                    message: error.localizedDescription,
                                                    preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "segueLogin" {
            if let vc = segue.destination as? QuizzViewController {
                vc.session = (sender as! SPTSession)
            }
        }
    }
}


