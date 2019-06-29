//
//  Model.swift
//  Quizz
//
//  Created by Mateus Filho on 31/05/19.
//  Copyright © 2019 Mateus Filho. All rights reserved.
//

import Foundation
import UIKit


class Singleton {
    static let shared = Singleton()
    private init () {
        
        
    }
    var acertos = 0
    var resultadosFinal :[Bool] = []
    var artistNames     :[String] = []
    var musicNames      :[String] = []
    var urlImageArtista :[String] = []
    let perguntas = [
        Pergunta(id           :0,
                 nomeMusica   :"Banho de sol",
                 nomeArtista  :"Baco Exu do Blues",
                 questao      :"Quem é o músico",
                 respostas    :["Djonga",
                                "BK",
                                "Pixinguinha",
                                "Baco Exu do Blues"],
                 correct      :3,
                 musica       :"spotify:track:2SFqE5mNkWXZfAcHSVhKAG"),
        
        Pergunta(id           :1,
                 nomeMusica   :"You don't know me",
                 nomeArtista  :"Caetano Veloso",
                 questao      :"Quem é o músico",
                 respostas    :["Caetano Veloso",
                                "Elton John",
                                "Paul McCartney",
                                "Chico Buarque"],
                 correct      :0,
                 musica       :"spotify:track:7Fw7VPZTX461fLYo72UkV1"),
        
        Pergunta(id           :2,
                 nomeMusica   :"Steve Lacy",
                 nomeArtista  :"Dark Red",
                 questao      :"Quem é o músico",
                 respostas    :["Tuyo",
                                "Steve Lacy",
                                "Tyler, The Creator",
                                "Rex Orange County"],
                 correct      :1,
                 musica       :"spotify:track:37y7iDayfwm3WXn5BiAoRk"),
        
        Pergunta(id           :3,
                 nomeMusica   :"Carinhoso",
                 nomeArtista  :"Pixinguinha",
                 questao      :"Quem é o músico",
                 respostas    :["Vinicius de Morais",
                                 "Pixinguinha",
                                 "Baden Powell",
                                 "Alvin e os Esquilos"],
                 correct      :1,
                 musica       :"spotify:track:0Z9kYW51a2Fh8YHN0NtGQn"),
        
        Pergunta(id           :4,
                 nomeMusica   :"Phonyppl",
                 nomeArtista  :"Somehow.",
                 questao      :"Qual é o nome\nda música",
                 respostas    :["Somehow.",
                                "DARKRYD",
                                "Loving you",
                                "Sunflower"],
                 correct      :0,
                 musica       :"spotify:track:2zk7TQx9Xa4yxYmsjgDCPp"),
        
        Pergunta(id           :5,
                 nomeMusica   :"Rex Orange County",
                 nomeArtista  :"Sunflower",
                 questao      :"Qual é o nome\nda música",
                 respostas    :["i`m not the right one",
                                "Eu caçador de mim",
                                "Sunflower",
                                "Haruka Kanata"],
                 correct      :2,
                 musica       :"spotify:album:1FhmTMNe8AziAPkB29114F"),
        
        Pergunta(id           :6,
                 nomeMusica   :"Lianne La havas",
                 nomeArtista  :"Au cinema",
                 questao      :"Qual o nome\nda cantora",
                 respostas    :["Lianne La Havas",
                                "Esperanza Spalding",
                                "Beyonce",
                                "SIA"],
                 correct      :0,
                 musica       :"spotify:track:4RYhqQjBtsfqahsqgVcrOq"),
        
        Pergunta(id           : 7,
                 nomeMusica   :"The Lung",
                 nomeArtista  :"Hiatus Kaiyote",
                 questao      :"Qual o nome\nda Banda",
                 respostas    :["Hiatus Kaiyote",
                                "ThunderCat",
                                "The Internet",
                                "Mongolian Chop Squad"],
                 correct      :0,
                 musica       :"spotify:track:45GTuMUP3lNuZcw7MGKfhx"),
        
        Pergunta(id           :8,
                 nomeMusica   :"Ponta de Areia",
                 nomeArtista  :"Esperanza Spalding",
                 questao      :"Quem canta",
                 respostas    :["Maria Rita",
                                "Céu",
                                "Esperanza Spalding",
                                "Bibi Caetano"],
                 correct      :2,
                 musica       :"spotify:album:7188JsHTl3rladofF7CVvW"),
        
        Pergunta(id           :9,
                 nomeMusica   :"Distractions",
                 nomeArtista  :"Sia and Zero 7",
                 questao      :"Quem canta",
                 respostas    :["Beyoncé",
                                "Bibi Caetano",
                                "Madonna",
                                "SIA"],
                 correct      :3,
                 musica       :"spotify:track:6W7SsXRozQ8qEBffSmwycJ")
    ]
}
