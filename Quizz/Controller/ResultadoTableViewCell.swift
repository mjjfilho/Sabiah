//
//  ResultadoTableViewCell.swift
//  Quizz
//
//  Created by Mateus Filho on 28/06/19.
//  Copyright © 2019 Mateus Filho. All rights reserved.
//

import UIKit

class ResultadoTableViewCell: UITableViewCell {

    @IBOutlet weak var viewImage: UIView!

    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var nomeMusica: UILabel!
    @IBOutlet weak var nomeArtista: UILabel!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var imagemArtista: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
