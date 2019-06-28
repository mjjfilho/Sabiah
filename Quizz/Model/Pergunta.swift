//
//  Perguntas.swift
//  Quizz
//
//  Created by Mateus Filho on 31/05/19.
//  Copyright © 2019 Mateus Filho. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Pergunta{
    internal init(id: Int, nomeMusica: String?, nomeArtista: String?, questao: String, respostas: [String], correct: Int, musica: String) {
        self.id = id
        self.nomeMusica = nomeMusica
        self.nomeArtista = nomeArtista
        self.questao = questao
        self.respostas = respostas
        self.correct = correct
        self.musica = musica
    }
    
  
    let id          : Int
    let nomeMusica  : String?
    let nomeArtista : String?
    let questao     : String
    let respostas   : [String]
    let correct     : Int
    let musica      : String
}
    
    
    
    //        self.música = música
    
    //    var música:           SKAudioNode

