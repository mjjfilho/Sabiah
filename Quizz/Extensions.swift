//
//  Extensions.swift
//  Quizz
//
//  Created by Mateus Filho on 26/06/19.
//  Copyright © 2019 Mateus Filho. All rights reserved.
//

import Foundation

extension Notification.Name {
    struct Spotify {
        static let authURLOpened = Notification.Name("authURLOpened")
    }
}

struct Constants {
    static let clientID = "126b6906fbb546d9bc6c9c9426290ace"
    static let redirectURI = URL(string: "sabiah://")!
    static let sessionKey = "spotifySessionKey"
}
