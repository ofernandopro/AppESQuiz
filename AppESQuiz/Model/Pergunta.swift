//
//  Pergunta.swift
//  AppESQuiz
//
//  Created by Fernando Moreira on 04/12/23.
//

import Foundation

struct Pergunta {
    var id: String
    var pergunta: String
    var alt1: String
    var alt2: String
    var alt3: String
    var alt4: String
    var altCorreta: Int
    var nivel: Int
    var areaConhecimento: Int // 0 -> Humanas, 1 -> Naturezas, 2 -> Exatas, 3 -> Geral
}
