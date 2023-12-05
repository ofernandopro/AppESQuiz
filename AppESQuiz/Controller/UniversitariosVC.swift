//
//  UniversitariosVC.swift
//  AppESQuiz
//
//  Created by Fernando Moreira on 04/12/23.
//

import UIKit

protocol UniversitariosVCDelegate: AnyObject {
    func clicouMostrarRespostas()
}
class UniversitariosVC: UIViewController {
    
    var pergunta: Pergunta?
    var delegate: UniversitariosVCDelegate?
    
    @IBOutlet weak var resposta1Label: UILabel!
    @IBOutlet weak var resposta2Label: UILabel!
    @IBOutlet weak var resposta3Label: UILabel!
    
    @IBAction func onTapRevelarRespostasButton(_ sender: Any) {
        delegate?.clicouMostrarRespostas()
        atribuirRespostas()
    }
    
    @IBAction func onTapFecharButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resposta1Label.isHidden = true
        resposta2Label.isHidden = true
        resposta3Label.isHidden = true
    }
    
    func atribuirRespostas() {
        resposta1Label.isHidden = false
        resposta2Label.isHidden = false
        resposta3Label.isHidden = false
        
        if let pergunta = self.pergunta {
            
            let altCorreta = pergunta.altCorreta
            let randomNum = Int.random(in: 0..<2)
            
            if pergunta.areaConhecimento == 0 { // Humanas
                
                let labels = setLabelsTemaHumanas(randomNum: randomNum, altCorreta: altCorreta, nivel: pergunta.nivel)
                resposta1Label.text = labels.0
                resposta2Label.text = labels.1
                resposta3Label.text = labels.2
                
            } else if pergunta.areaConhecimento == 1 { // Naturezas
                
                let labels = setLabelsTemaNaturezas(randomNum: randomNum, altCorreta: altCorreta, nivel: pergunta.nivel)
                resposta1Label.text = labels.0
                resposta2Label.text = labels.1
                resposta3Label.text = labels.2
                
            } else if pergunta.areaConhecimento == 2 { // Exatas
                
                let labels = setLabelsTemaExatas(randomNum: randomNum, altCorreta: altCorreta, nivel: pergunta.nivel)
                resposta1Label.text = labels.0
                resposta2Label.text = labels.1
                resposta3Label.text = labels.2
                
            } else {
                let labels = setLabelsTemaGeral(num: Int.random(in: 0..<3), altCorreta: altCorreta)
                resposta1Label.text = labels.0
                resposta2Label.text = labels.1
                resposta3Label.text = labels.2
            }
            
        }
    }
    
    func setLabelsTemaHumanas(randomNum: Int, altCorreta: Int, nivel: Int) -> (String, String, String) {
        resposta2Label.text = getNumAlt(alt: altCorreta)
        
        if nivel > 2 {
            if randomNum == 0 {
                return (getNumAlt(alt: altCorreta), getNumAlt(alt: altCorreta), getWrongAlt(altCorreta: altCorreta))
            } else {
                return (getWrongAlt(altCorreta: altCorreta), getNumAlt(alt: altCorreta), getNumAlt(alt: altCorreta))
            }
        } else {
            return (getNumAlt(alt: altCorreta), getNumAlt(alt: altCorreta), getNumAlt(alt: altCorreta))
        }
    }
    
    func setLabelsTemaNaturezas(randomNum: Int, altCorreta: Int, nivel: Int) -> (String, String, String) {
        if nivel > 2 {
            if randomNum == 0 {
                return (getNumAlt(alt: altCorreta), getWrongAlt(altCorreta: altCorreta), getNumAlt(alt: altCorreta))
            } else {
                return (getWrongAlt(altCorreta: altCorreta), getNumAlt(alt: altCorreta), getNumAlt(alt: altCorreta))
            }
        } else {
            return (getNumAlt(alt: altCorreta), getNumAlt(alt: altCorreta), getNumAlt(alt: altCorreta))
        }
    }
    
    func setLabelsTemaExatas(randomNum: Int, altCorreta: Int, nivel: Int) -> (String, String, String) {
        if nivel > 2 {
            if randomNum == 0 {
                return (getNumAlt(alt: altCorreta), getNumAlt(alt: altCorreta), getWrongAlt(altCorreta: altCorreta))
            } else {
                return (getNumAlt(alt: altCorreta), getWrongAlt(altCorreta: altCorreta), getNumAlt(alt: altCorreta))
            }
        } else {
            return (getNumAlt(alt: altCorreta), getNumAlt(alt: altCorreta), getNumAlt(alt: altCorreta))
        }
    }
    
    func setLabelsTemaGeral(num: Int, altCorreta: Int) -> (String, String, String) {
        if num == 0 {
            return (getNumAlt(alt: altCorreta), getWrongAlt(altCorreta: altCorreta), getAnotherWrongAlt(altCorreta: altCorreta))
        } else if num == 1 {
            return (getWrongAlt(altCorreta: altCorreta), getNumAlt(alt: altCorreta), getAnotherWrongAlt(altCorreta: altCorreta))
        } else {
            return (getWrongAlt(altCorreta: altCorreta), getAnotherWrongAlt(altCorreta: altCorreta), getNumAlt(alt: altCorreta))
        }
    }
    
    func getNumAlt(alt: Int) -> String {
        switch alt {
        case 1:
            return "A"
        case 2:
            return "B"
        case 3:
            return "C"
        case 4:
            return "D"
        default:
            return ""
        }
    }
    
    func getWrongAlt(altCorreta: Int) -> String {
        switch altCorreta {
        case 1:
            return "B"
        case 2:
            return "A"
        case 3:
            return "D"
        case 4:
            return "C"
        default:
            return ""
        }
    }
    
    func getAnotherWrongAlt(altCorreta: Int) -> String {
        switch altCorreta {
        case 1:
            return "C"
        case 2:
            return "D"
        case 3:
            return "A"
        case 4:
            return "B"
        default:
            return ""
        }
    }
    
}
