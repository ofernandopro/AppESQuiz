//
//  QuizVCE2ETests.swift
//  AppESQuizTests
//
//  Created by Fernando Moreira on 04/12/23.
//

import XCTest
@testable import AppESQuiz

class QuizVCE2ETests: XCTestCase {
    
    var quizVC: QuizVC!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        quizVC = storyboard.instantiateViewController(withIdentifier: "QuizVC") as? QuizVC
        quizVC.loadViewIfNeeded()
    }
    
    override func tearDown() {
        quizVC = nil
        super.tearDown()
    }
    
    func testQuizViewControllerInitialState() {
        // Verifica se os elementos de interface estão carregados corretamente
        XCTAssertNotNil(quizVC.startButton)
        XCTAssertNotNil(quizVC.perguntaLabel)
        XCTAssertNotNil(quizVC.alt1Label)
        XCTAssertNotNil(quizVC.alt2Label)
        XCTAssertNotNil(quizVC.alt3Label)
        XCTAssertNotNil(quizVC.alt4Label)
        XCTAssertNotNil(quizVC.pontuacaoLabel)
        XCTAssertNotNil(quizVC.resultadoLabel)
    }
    
    func testSubmitButtonAction() {
        // Given
        let btn = quizVC.startButton ?? UIButton()
        
        // When
        quizVC.onTapSubmitButton(btn)
        
        // Then
        XCTAssertFalse(quizVC.startButton.isHidden)
    }
    
    func testSortearPergunta() {
        // Given
        quizVC.sortearPergunta(num: 0)
        
        // Then
        // Verifica se a pergunta e as alternativas são atualizadas corretamente
        XCTAssertNotNil(quizVC.pergunta)
        XCTAssertNotNil(quizVC.alt1Label.text)
        XCTAssertNotNil(quizVC.alt2Label.text)
        XCTAssertNotNil(quizVC.alt3Label.text)
        XCTAssertNotNil(quizVC.alt4Label.text)
    }
    
}
