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

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
