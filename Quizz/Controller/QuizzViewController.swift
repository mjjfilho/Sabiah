//
//  QuizzViewController.swift
//  Quizz
//
//  Created by Mateus Filho on 31/05/19.
//  Copyright © 2019 Mateus Filho. All rights reserved.
//

import UIKit
import AVFoundation

class QuizzViewController: UIViewController {
    @IBOutlet weak var questionMusician: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    //Outlet dos botão
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var btNext: UIButton!
    @IBOutlet var optionVisualFeedback: [UIImageView]!
    @IBOutlet var enumVisual: [UIImageView]!
    
    //Singleton
    var perguntas              : [Pergunta] = Singleton.shared.perguntas.shuffled()
    var musica                 : String {return perguntas[numberOfQuestion].musica}
    
    //Variaveis locais
    var numberOfQuestion  = 0
    var hits                 : Int = 0
    var misses               : Int = 0
    var correctAnswer        : Int = 0
    var answerDidSelect      : Bool = false
    
    //Variaveis SPT
    var audioPlayer            : AVAudioPlayer? = nil
    var player                 : SPTAudioStreamingController = SPTAudioStreamingController.sharedInstance()
    var session                : SPTSession?
    var logged                 : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestions()
        optionA.layer.cornerRadius = 10
        optionB.layer.cornerRadius = 10
        optionC.layer.cornerRadius = 10
        optionD.layer.cornerRadius = 10
        btNext.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        //Começar carregamento da tela
        handleNewSession()
    }
    
    func handleNewSession() {
        if let session = session {
            self.player.delegate = self
            self.player.playbackDelegate = self
            self.player.login(withAccessToken: session.accessToken)
        }
    }
    
    @IBAction func botaoApertado(_ sender: UIButton) {
        //Valida se o botão apertado é certo
        if answerDidSelect == false {
            if sender.tag == correctAnswer {
                optionVisualFeedback[sender.tag].image = #imageLiteral(resourceName: "correct")
                enumVisual[numberOfQuestion].image = #imageLiteral(resourceName: "Oval")
                Singleton.shared.acertos += 1
                Singleton.shared.resultadosFinal.append(true)
                /*aparece a imagem certa - done e a bolinha laranja */
            }
            else {
                optionVisualFeedback[sender.tag].image = #imageLiteral(resourceName: "Path Copy")
                enumVisual[numberOfQuestion].image = #imageLiteral(resourceName: "BolinhaBlack")
                optionVisualFeedback[correctAnswer].image = #imageLiteral(resourceName: "correct")
                Singleton.shared.resultadosFinal.append(false)
                /* aparece a imagem certa, aparece a imagem errada, em suas respectivas questões e a bolinha preta */
            }
        }
        answerDidSelect = true
        btNext.isHidden = false
    }
    @IBAction func btNextquestion(_ sender: Any) {
        nextQuestion()
        updateQuestions()
    }
    
    func nextQuestion () {
        //Anda na trilha de perguntas
        numberOfQuestion += 1
        if numberOfQuestion < 5 {
            
        } else {
           
//            Singleton.shared.acertos = hits
            numberOfQuestion = Int((0...perguntas.count-1).randomElement()!)
            performSegue(withIdentifier: "resultSegue", sender: nil)
            //            if let vc = storyboard?.instantiateViewController(withIdentifier: "Resultado") as? ResultadoViewController {
            //                self.dismiss(animated: true) {
            //                    self.navigationController?.pushViewController(vc, animated: true)
            //                }
            //            }
        }
    }
    func updateQuestions() {
        questionLabel.text = perguntas[numberOfQuestion].questao
        optionA.setTitle(perguntas[numberOfQuestion].respostas[0], for: UIControl.State.normal)
        optionB.setTitle(perguntas[numberOfQuestion].respostas[1], for: UIControl.State.normal)
        optionC.setTitle(perguntas[numberOfQuestion].respostas[2], for: UIControl.State.normal)
        optionD.setTitle(perguntas[numberOfQuestion].respostas[3], for: UIControl.State.normal)
        correctAnswer = perguntas[numberOfQuestion].correct
        answerDidSelect = false
        btNext.isHidden = true
        for i in optionVisualFeedback {
            i.image = nil
        }
        /* perguntar se aqui é o melhor momento para alterar essa variavel, e como lidar com hierarquia */
        //sessão música
        //paraMusica()
        tocarMusica()
        
        //        Código do playground
        //        var db4Note = SKAction.playSoundFileNamed("\(musica)", waitForCompletion: false)
        //        self.view? - perguntar por que isso não funciona pra alguém - .run(db4Note)
        
    }
    
    func tocarMusica() {
        guard logged else {
            return
        }
        
        self.player.playSpotifyURI(perguntas[numberOfQuestion].musica, startingWith: 0, startingWithPosition: Double((10...30).randomElement()!)) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        
        
        //        do {
        //            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath:Bundle.main.path(forResource: musica, ofType: "mp3")!))
        //            audioPlayer?.play()
        //        } catch {}
        
    }
//    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
    
//    func downloadImage(from url: URL) {
//        print("Download Started")
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
//            DispatchQueue.main.async() {
//                self.imageView.image = UIImage(data: data)
//            }
//        }
//    }
    
    //    func paraMusica() {
    //        audioPlayer?.stop()
    //    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}



extension QuizzViewController: SPTAudioStreamingDelegate, SPTAudioStreamingPlaybackDelegate {
    func audioStreamingDidLogin(_ audioStreaming: SPTAudioStreamingController) {
        print("StreamingDidLogin Player pronto!")
        //Terminar carregamento
        logged = true
        tocarMusica()
    }
    
    func audioStreaming(_ audioStreaming: SPTAudioStreamingController, didChange metadata: SPTPlaybackMetadata) {
        if Singleton.shared.artistNames.last != metadata.currentTrack?.artistName {
        Singleton.shared.artistNames.append(metadata.currentTrack?.artistName ?? "Artista não encontrado")
        }
        if Singleton.shared.musicNames.last != metadata.currentTrack?.name{
            Singleton.shared.musicNames.append(metadata.currentTrack?.name ?? "Música não encontrada")
        }
        if Singleton.shared.urlImageArtista.last != metadata.currentTrack?.albumCoverArtURL {
            Singleton.shared.urlImageArtista.append((metadata.currentTrack?.albumCoverArtURL) ?? "")
        }
        
    }
}

