//
//  ResultadoViewController.swift
//  Quizz
//
//  Created by Mateus Filho on 31/05/19.
//  Copyright © 2019 Mateus Filho. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var player                 : SPTAudioStreamingController = SPTAudioStreamingController.sharedInstance()
    var session                : SPTSession?
    var imagemArtista          : [UIImage] = []
    var imagesUrl = Singleton.shared.urlImageArtista
    @IBOutlet weak var hit: UILabel!
    @IBOutlet weak var dismissBt: UIButton!
    
    var quizViewController: QuizzViewController!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellResultado = tableView.dequeueReusableCell(withIdentifier: "CellResultado", for: indexPath) as! ResultadoTableViewCell
        cellResultado.background.layer.cornerRadius = 10
        
        cellResultado.nomeArtista.text = Singleton.shared.artistNames[indexPath.row]
        cellResultado.nomeMusica.text = Singleton.shared.musicNames[indexPath.row]
        if Singleton.shared.resultadosFinal[indexPath.row] == true {
            cellResultado.resultImage.image = #imageLiteral(resourceName: "Oval")
        } else {
            cellResultado.resultImage.image = #imageLiteral(resourceName: "BegeBolinha")
        }
        //              if cellResultado.imagemArtista.image == nil {
        //        let url = URL(string: Singleton.shared.urlImageArtista[indexPath.row])
        //
        //        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        //
        //        cellResultado.imagemArtista.image = UIImage(data: data!)
        //        }
        cellResultado.imagemArtista.image = imagemArtista[indexPath.row]
        cellResultado.viewImage.layer.cornerRadius = 10
        cellResultado.viewImage.clipsToBounds = true
        
        
        return cellResultado
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var acertos = Singleton.shared.acertos
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for image in imagesUrl {
            let url = URL(string: image)
            let data = try? Data(contentsOf: url!)
            imagemArtista.append(UIImage(data: (data)!)!)
            
        }
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        hit.text = ("\(Singleton.shared.acertos)")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tocarMusica(position: indexPath.row)
    }
    
    func tocarMusica(position: Int) {
        self.player.playSpotifyURI("\(Singleton.shared.listaMusic[position].musica)", startingWith: 0, startingWithPosition: 0) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func btdismiss(_ sender: Any) {
        performSegue(withIdentifier: "backToBegin", sender: nil)
        
    }
    //    override func viewWillAppear(_ animated: Bool) {
    //        acertosLabel.text = "Você obteve 
    //\(acertos) acertos "
    //        if acertos == 0 {
    //            resultadoLabel.text = "Que pena! Você não acertou nenhum :("
    //        } else if acertos <= 4 { resultadoLabel.text = "você é um mero iniciante"
    //
    //        } else if acertos < 7 {
    //            resultadoLabel.text = "Uau! Mandou bem hein?"
    //
    //        } else if acertos <= 8 {
    //            resultadoLabel.text = "Aí, manja das manjarias" }
    //        else {
    //            resultadoLabel.text = "Perfeito, sem erros"
    //        }
    //
    




// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    
    if segue.identifier == "backToBegin"{
        let dest = segue.destination as! BeginViewController
        dest.beginController = self
    }
}


}
