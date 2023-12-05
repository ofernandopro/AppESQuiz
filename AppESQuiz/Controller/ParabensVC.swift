//
//  ParabensVC.swift
//  AppESQuiz
//
//  Created by Fernando Moreira on 04/12/23.
//

import Foundation
import UIKit

class ParabensVC: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func onTapVoltarButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    var valorGanho: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        if let valorGanho = valorGanho {
            
            titleLabel.text = setTitleLabel(valorGanho: valorGanho)
            subtitleLabel.text = setSubtitleLabel(valorGanho: valorGanho)
            imageView.image = UIImage(named: setImageView(valorGanho: valorGanho))
            backgroundImage.image = UIImage(named: setBackgroundImageView(valorGanho: valorGanho))
            
        }
            
    }
    
    func setTitleLabel(valorGanho: Int) -> String {
        
        if valorGanho == 0 {
            return "Tudo tem um começo!"
        } else if valorGanho <= 10000 {
            return "Treine mais da próxima vez!"
        } else if valorGanho <= 50000 {
            return "Bom resultado mas poderia ser melhor!"
        } else if valorGanho <= 200000 {
            return "Bom resultado mas poderia ser melhor!"
        } else if valorGanho <= 500000 {
            return "Bom resultado mas poderia ser melhor!"
        } else if valorGanho < 1000000 {
            return "Parabéns!"
        } else {
            return "Parabéns!!!"
        }
        
    }
    
    func setSubtitleLabel(valorGanho: Int) -> String {
        
        if valorGanho == 0 {
            return "Você não ganhou nada!"
        } else if valorGanho >= 1000000 {
            return "Você ganhou 1 milhão!!!"
        }
        
        let valor = Utils.formatCurrencyString("\(valorGanho)")
        if let valor = valor {
            return "Você ganhou \(valor)!"
        }
        
        return ""
        
    }
    
    func setImageView(valorGanho: Int) -> String {
        
        if valorGanho == 0 {
            return "sem-dinheiro"
        } else if valorGanho <= 10000 {
            return "dinheiro-nivel-1"
        } else if valorGanho <= 50000 {
            return "dinheiro-nivel-2"
        } else if valorGanho <= 200000 {
            return "dinheiro-nivel-3"
        } else if valorGanho <= 500000 {
            return "dinheiro-nivel-4"
        } else if valorGanho < 1000000 {
            return "dinheiro-nivel-5"
        } else {
            return "dinheiro-1-milhao"
        }
        
    }
    
    func setBackgroundImageView(valorGanho: Int) -> String {
        
        if valorGanho == 0 {
            return "background-sem-dinheiro"
        } else if valorGanho <= 10000 {
            return "background-dinheiro"
        } else if valorGanho <= 50000 {
            return "background-dinheiro"
        } else if valorGanho <= 200000 {
            return "background-dinheiro"
        } else if valorGanho <= 500000 {
            return "background-dinheiro"
        } else if valorGanho < 1000000 {
            return "background-dinheiro"
        } else {
            return "background-milhao"
        }
        
    }
    
}
