//
//  QuizVC.swift
//  AppESQuiz
//
//  Created by Fernando Moreira on 04/12/23.
//

import Foundation
import UIKit

class QuizVC: UIViewController {
    
    // MARK: - Properties
    
    var altSelected: Int = 0
    var numPergunta = 0
    var altCorreta: Int = 0
    var pergunta: Pergunta?
    var viewModel: QuizViewModel = QuizViewModel()
    var valoresPerguntas = [500, 1000, 2000, 5000, 10000, 20000, 50000, 100000, 200000, 300000, 400000, 500000, 1000000]
    var randomInt: Int?
    var foiRespondida: Bool = false
    var respostaErrada = false
    var qntAltsEliminadas: Int = 0
    var customGray: UIColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
    
    // MARK: - Outlets and Actions
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pararButton: UIButton!
    @IBOutlet weak var perguntaLabel: UILabel!
    @IBOutlet weak var alt1Label: UILabel!
    @IBOutlet weak var alt2Label: UILabel!
    @IBOutlet weak var alt3Label: UILabel!
    @IBOutlet weak var alt4Label: UILabel!
    @IBOutlet weak var pontuacaoLabel: UILabel!
    @IBOutlet weak var startButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var alt1View: UIView!
    @IBOutlet weak var alt2View: UIView!
    @IBOutlet weak var alt3View: UIView!
    @IBOutlet weak var alt4View: UIView!
    @IBOutlet weak var eliminarAltsView: UIView!
    @IBOutlet weak var universitariosView: UIView!
    @IBOutlet weak var eliminarAltsImageView: UIImageView!
    @IBOutlet weak var universitariosImageView: UIImageView!
    
    @IBAction func onTapSubmitButton(_ sender: Any) {
        
        if altSelected == 0 {
            return
        }
        
        let altCorreta = viewModel.perguntas[randomInt ?? 0].altCorreta
        
        pintarViewCorretaEIncorretas(altCorreta: altCorreta, altSelected: altSelected)
        
        resultadoLabel.isHidden = false
        
        if !foiRespondida {
            
            if altSelected == altCorreta {
                let valor = NumberFormatter.localizedString(from: NSNumber(value: valoresPerguntas[numPergunta]), number: .currency)
                resultadoLabel.text = "Resposta Correta! Você já ganhou \(valor) 😀"
                resultadoLabel.textColor = .systemGreen
                startButton.isHidden = false
                pararButton.isHidden = false
                startButtonBottomConstraint.constant = 80
                pararButton.setTitle("Parar", for: .normal)
                startButton.setTitle("Próxima Pergunta", for: .normal)
            } else {
                resultadoLabel.text = "Infelizmente você perdeu 😞"
                resultadoLabel.textColor = .systemPink
                startButton.isHidden = true
                pararButton.isHidden = false
                startButtonBottomConstraint.constant = 80
                pararButton.setTitle("Voltar", for: .normal)
                respostaErrada = true
            }
            
            foiRespondida = true
            
        } else {
            
            if numPergunta < 12 {
                if valoresPerguntas[numPergunta] > UserDefaults.standard.integer(forKey: "maiorPontuacao") {
                    UserDefaults.standard.setValue(valoresPerguntas[numPergunta], forKey: "maiorPontuacao")
                }
            } else {
                if 1000000 > UserDefaults.standard.integer(forKey: "maiorPontuacao") {
                    UserDefaults.standard.setValue(1000000, forKey: "maiorPontuacao")
                }
            }
            
            startButton.setTitle("Conferir", for: .normal)
            
            altSelected = 0
            numPergunta += 1
            
            if numPergunta < 13 {
                let valor = Utils.formatCurrencyString("\(valoresPerguntas[numPergunta])")
                if let valor = valor {
                    pontuacaoLabel.text = "Valendo R$\(valor)"
                }
                resultadoLabel.isHidden = true
                pararButton.isHidden = true
                startButtonBottomConstraint.constant = 20
                reiniciarCores()
                sortearPergunta(num: Int.random(in: 0..<viewModel.perguntas.count))
                foiRespondida = false
                
            } else {
                irParaParabensVC()
            }
            
            alt1View.isHidden = false
            alt2View.isHidden = false
            alt3View.isHidden = false
            alt4View.isHidden = false
            
        }
        
    }
    
    @IBAction func onTapPararButton(_ sender: Any) {
        if respostaErrada {
            irParaParabensVC()
        } else {
            showAlert(title: "Alerta", message: "Tem certeza que deseja parar?")
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        resultadoLabel.isHidden = true
        let valor = NumberFormatter.localizedString(from: NSNumber(value: valoresPerguntas[numPergunta]), number: .currency)
        pontuacaoLabel.text = "Valendo \(valor)"
        
        pararButton.isHidden = true
        startButtonBottomConstraint.constant = 20
        
        sortearPergunta(num: Int.random(in: 0..<viewModel.perguntas.count))
        addTapGestures()
    }
    
    // MARK: - Methods
    
    func sortearPergunta(num: Int) {
        let numPergunta = viewModel.getPerguntaPorNivel(numPergunta: numPergunta, randomInt: num)
        self.randomInt = numPergunta
        
        self.altCorreta = viewModel.perguntas[numPergunta].altCorreta
        self.pergunta = viewModel.perguntas[numPergunta]
        
        perguntaLabel.text = "\(viewModel.perguntas[numPergunta].pergunta)"
        alt1Label.text = "\(viewModel.perguntas[numPergunta].alt1)"
        alt2Label.text = "\(viewModel.perguntas[numPergunta].alt2)"
        alt3Label.text = "\(viewModel.perguntas[numPergunta].alt3)"
        alt4Label.text = "\(viewModel.perguntas[numPergunta].alt4)"
    }
    
    func reiniciarCores() {
        alt1View.backgroundColor = customGray
        alt2View.backgroundColor = customGray
        alt3View.backgroundColor = customGray
        alt4View.backgroundColor = customGray
    }
    
    func addTapGestures() {
        alt1View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapAlt1View)))
        alt2View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapAlt2View)))
        alt3View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapAlt3View)))
        alt4View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapAlt4View)))
        eliminarAltsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapEliminarAltsView)))
        universitariosView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapUniversitariosView)))
    }
    
    func pintarViewCorretaEIncorretas(altCorreta: Int, altSelected: Int) {
        
        if altCorreta == altSelected {
            if altCorreta == 1 {
                alt1View.backgroundColor = .systemGreen
            } else if altCorreta == 2 {
                alt2View.backgroundColor = .systemGreen
            } else if altCorreta == 3 {
                alt3View.backgroundColor = .systemGreen
            } else {
                alt4View.backgroundColor = .systemGreen
            }
        } else {
            if altSelected == 1 {
                alt1View.backgroundColor = .systemRed
                if altCorreta == 2 {
                    alt2View.backgroundColor = .systemGreen
                } else if altCorreta == 3 {
                    alt3View.backgroundColor = .systemGreen
                } else if altCorreta == 4 {
                    alt4View.backgroundColor = .systemGreen
                }
            } else if altSelected == 2 {
                alt2View.backgroundColor = .systemRed
                if altCorreta == 1 {
                    alt1View.backgroundColor = .systemGreen
                } else if altCorreta == 3 {
                    alt3View.backgroundColor = .systemGreen
                } else if altCorreta == 4 {
                    alt4View.backgroundColor = .systemGreen
                }
            } else if altSelected == 3 {
                alt3View.backgroundColor = .systemRed
                if altCorreta == 1 {
                    alt1View.backgroundColor = .systemGreen
                } else if altCorreta == 2 {
                    alt2View.backgroundColor = .systemGreen
                } else if altCorreta == 4 {
                    alt4View.backgroundColor = .systemGreen
                }
            } else {
                alt4View.backgroundColor = .systemRed
                if altCorreta == 1 {
                    alt1View.backgroundColor = .systemGreen
                } else if altCorreta == 2 {
                    alt2View.backgroundColor = .systemGreen
                } else if altCorreta == 3 {
                    alt3View.backgroundColor = .systemGreen
                }
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: { (action: UIAlertAction!) in
            self.irParaParabensVC()
          }))
        alert.addAction(UIAlertAction(title: "Não", style: .cancel, handler: { (action: UIAlertAction!) in
          }))
        present(alert, animated: true, completion: nil)
    }
    
    func irParaParabensVC() {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ParabensVC") as! ParabensVC
        vc.modalPresentationStyle = .fullScreen
        vc.valorGanho = setValorGanho(numPergunta: numPergunta)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setValorGanho(numPergunta: Int) -> Int {
        if numPergunta > 0 {
            return valoresPerguntas[numPergunta-1]
        } else {
            return 0
        }
    }
    
    // MARK: - Objc Methods
    
    @objc func onTapAlt1View() {
        altSelected = 1
        alt1View.backgroundColor = UIColor.lightGray
        alt2View.backgroundColor = customGray
        alt3View.backgroundColor = customGray
        alt4View.backgroundColor = customGray
    }
    
    @objc func onTapAlt2View() {
        altSelected = 2
        alt1View.backgroundColor = customGray
        alt2View.backgroundColor = UIColor.lightGray
        alt3View.backgroundColor = customGray
        alt4View.backgroundColor = customGray
    }
    
    @objc func onTapAlt3View() {
        altSelected = 3
        alt1View.backgroundColor = customGray
        alt2View.backgroundColor = customGray
        alt3View.backgroundColor = UIColor.lightGray
        alt4View.backgroundColor = customGray
    }
    
    @objc func onTapAlt4View() {
        altSelected = 4
        alt1View.backgroundColor = customGray
        alt2View.backgroundColor = customGray
        alt3View.backgroundColor = customGray
        alt4View.backgroundColor = UIColor.lightGray
    }
    
    @objc func onTapEliminarAltsView() {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "EliminarAltsVC") as! EliminarAltsVC
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func onTapUniversitariosView() {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "UniversitariosVC") as! UniversitariosVC
        if let pergunta = self.pergunta {
            vc.pergunta = pergunta
        }
        vc.delegate = self
        present(vc, animated: true)
    }
}
// MARK: - Protocols
extension QuizVC: EliminarAltsVCDelegate, UniversitariosVCDelegate {
    
    func clicouMostrarRespostas() {
        universitariosView.backgroundColor = .systemGray
        universitariosImageView.image = UIImage(named: "graduation_disabled")
        
        universitariosView.isUserInteractionEnabled = false
    }
    
    func getQntAltsEliminadas(qntAltsEliminadas: Int) {
        self.qntAltsEliminadas = qntAltsEliminadas
        
        eliminarAltsView.backgroundColor = .systemGray
        eliminarAltsImageView.image = UIImage(named: "forbidden_disabled")
        
        eliminarAltsView.isUserInteractionEnabled = false
        
        if qntAltsEliminadas == 0 {
            return
        }
        
        var altsQuePodemSerEliminadas: [Int] = getAltsQuePodemSerEliminadas(altCorreta: altCorreta)
        
        for _ in 0..<qntAltsEliminadas {
            let altEliminada = altsQuePodemSerEliminadas.randomElement() ?? 0
            altsQuePodemSerEliminadas = altsQuePodemSerEliminadas.filter { $0 != altEliminada }
            eliminateAlt(alt: altEliminada)
        }
        
    }
    
    func getAltsQuePodemSerEliminadas(altCorreta: Int) -> [Int] {
        var altsQuePodemSerEliminadas: [Int] = []
        
        for i in 1...4 {
            if i != altCorreta {
                altsQuePodemSerEliminadas.append(i)
            }
        }
        
        return altsQuePodemSerEliminadas
    }
    
    func eliminateAlt(alt: Int) {
        if alt == 1 {
            alt1View.isHidden = true
        } else if alt == 2 {
            alt2View.isHidden = true
        } else if alt == 3 {
            alt3View.isHidden = true
        } else if alt == 4 {
            alt4View.isHidden = true
        }
    }
    
}
