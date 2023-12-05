//
//  HomeVC.swift
//  AppESQuiz
//
//  Created by Fernando Moreira on 04/12/23.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var maiorPontuacaoLabel: UILabel!
    
    @IBAction func onTapStartButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "QuizVC") as! QuizVC
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let maiorPontuacaoSalva = UserDefaults.standard.integer(forKey: "maiorPontuacao")
        maiorPontuacaoLabel.text = getMaiorPontuacao(maiorPontuacaoSalva: maiorPontuacaoSalva)
        
        if maiorPontuacaoSalva == 1000000 {
            maiorPontuacaoLabel.textColor = .systemYellow
        } else {
            maiorPontuacaoLabel.textColor = .black
        }
    }
    
    func getMaiorPontuacao(maiorPontuacaoSalva: Int) -> String {
        if maiorPontuacaoSalva > 0 {
            let result = NumberFormatter.localizedString(from: NSNumber(value: maiorPontuacaoSalva), number: .currency)
            return "\(result)"
        } else {
            return "R$ 0,00"
        }
    }
    
}
