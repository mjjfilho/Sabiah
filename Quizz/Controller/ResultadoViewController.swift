//
//  ResultadoViewController.swift
//  Quizz
//
//  Created by Mateus Filho on 31/05/19.
//  Copyright © 2019 Mateus Filho. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var hit: UILabel!
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
        print(Singleton.shared.resultadosFinal[indexPath.row])
        if Singleton.shared.resultadosFinal[indexPath.row] == true {
            cellResultado.resultImage.image = #imageLiteral(resourceName: "Oval")
        } else {
            cellResultado.resultImage.image = #imageLiteral(resourceName: "BegeBolinha")
        }
        
        let url = URL(string: Singleton.shared.urlImageArtista[indexPath.row])
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        cellResultado.imagemArtista.image = UIImage(data: data!)
        
        
        return cellResultado
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var acertos = Singleton.shared.acertos
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        hit.text = ("\(Singleton.shared.acertos)")
        print(Singleton.shared.acertos)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
    
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


