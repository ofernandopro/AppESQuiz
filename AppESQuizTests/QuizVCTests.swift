//
//  QuizVCTests.swift
//  AppESQuizTests
//
//  Created by Fernando Moreira on 04/12/23.
//

import XCTest
@testable import AppESQuiz

class QuizVCTests: XCTestCase {
    
    var quizVC: QuizVC!
    var quizViewModel: QuizViewModel!
    
    override func setUp() {
        super.setUp()
        quizViewModel = QuizViewModel()
        self.quizVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "QuizVC") as? QuizVC
        self.quizVC?.loadView()
    }

    override func tearDown() {
        quizVC = nil
        quizViewModel = nil
        super.tearDown()
    }
    
    func testPerguntasNotEmpty() {
        // Given
        let perguntas = quizViewModel.perguntas
        
        // When
        let isEmpty = perguntas.isEmpty
        
        // Then
        XCTAssertFalse(isEmpty)
    }
    
    func testGetPerguntaPorNivel() {
        // Given
        let numPergunta = 3
        let randomInt = 5
        
        // When
        let result = quizViewModel.getPerguntaPorNivel(numPergunta: numPergunta, randomInt: randomInt)
        
        // Then
        XCTAssertNotEqual(result, 5)
    }
    
    func testGetPerguntaPorNivelForLevel1() {
        // Given
        let numPergunta = 1
        let randomInt = 5
        
        // When
        let result = quizViewModel.getPerguntaPorNivel(numPergunta: numPergunta, randomInt: randomInt)
        
        // Then
        XCTAssertNotEqual(result, 5)
    }
    
    func testGetPerguntaPorNivelForLevel2() {
        // Given
        let numPergunta = 2
        let randomInt = 5
        
        // When
        let result = quizViewModel.getPerguntaPorNivel(numPergunta: numPergunta, randomInt: randomInt)

        // Then
        XCTAssertNotEqual(result, 5)
    }
    
    func testGetPerguntaPorNivelForLevel4() {
        // Given
        let numPergunta = 4
        let randomInt = 5
        
        // When
        let result = quizViewModel.getPerguntaPorNivel(numPergunta: numPergunta, randomInt: randomInt)

        // Then
        XCTAssertNotEqual(result, 5)
    }
    
    func testGetPerguntaPorNivelForInvalidLevel() {
        // Given
        let numPergunta = 6
        let randomInt = 5
        
        // When
        let result = quizViewModel.getPerguntaPorNivel(numPergunta: numPergunta, randomInt: randomInt)

        // Then
        XCTAssertEqual(result, 5)
    }
    
    func testGetPerguntaPorNivelForRandomIntZero() {
        // Given
        let numPergunta = 3
        let randomInt = 0
        
        // When
        let result = quizViewModel.getPerguntaPorNivel(numPergunta: numPergunta, randomInt: randomInt)

        // Then
        XCTAssertNotEqual(result, 0)
    }
    
    func testEliminateAlt1() {
        // Given
        quizVC.eliminateAlt(alt: 1)
        
        // Then
        XCTAssertTrue(quizVC.alt1View.isHidden)
        XCTAssertFalse(quizVC.alt2View.isHidden)
        XCTAssertFalse(quizVC.alt3View.isHidden)
        XCTAssertFalse(quizVC.alt4View.isHidden)
    }
    
    func testEliminateAlt2() {
        // Given
        quizVC.eliminateAlt(alt: 2)
        
        // Then
        XCTAssertFalse(quizVC.alt1View.isHidden)
        XCTAssertTrue(quizVC.alt2View.isHidden)
        XCTAssertFalse(quizVC.alt3View.isHidden)
        XCTAssertFalse(quizVC.alt4View.isHidden)
    }
    
    func testGetAltsQuePodemSerEliminadas_Alt3Correta() {
        // Given
        let expectedAlts: [Int] = [1, 2, 4]
        
        // When
        let alts = quizVC.getAltsQuePodemSerEliminadas(altCorreta: 3)
        
        // Then
        XCTAssertEqual(alts, expectedAlts)
    }
    
    func testGetAltsQuePodemSerEliminadas_Alt1Correta() {
        // Given
        let expectedAlts: [Int] = [2, 3, 4]
        
        // When
        let alts = quizVC.getAltsQuePodemSerEliminadas(altCorreta: 1)
        
        // Then
        XCTAssertEqual(alts, expectedAlts)
    }
    
    func testSetValorGanho_NumPerguntaMaiorQueZero() {
        // Given
        let result = 2000
        
        // When
        let valor = quizVC.setValorGanho(numPergunta: 3)
        
        // Then
        XCTAssertEqual(valor, result)
    }
    
    func testSetValorGanho_NumPerguntaZero() {
        // Given
        let result = 0
        
        // When
        let valor = quizVC.setValorGanho(numPergunta: 0)
        
        // Then
        XCTAssertEqual(valor, result)
    }
    
}
