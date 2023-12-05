//
//  HomeVCTests.swift
//  AppESQuizTests
//
//  Created by Fernando Moreira on 04/12/23.
//

import XCTest
@testable import AppESQuiz

class HomeVCTests: XCTestCase {
    var homeVC: HomeVC!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        homeVC.loadViewIfNeeded()
    }

    override func tearDown() {
        homeVC = nil
        super.tearDown()
    }
    
    func testGetMaiorPontuacaoForZero() {
        // Given
        let maiorPontuacaoSalva: Int = 0
        
        // When
        let result = homeVC.getMaiorPontuacao(maiorPontuacaoSalva: maiorPontuacaoSalva)
        
        // Then
        XCTAssertEqual(result, "R$ 0,00")
    }
    
    func testGetMaiorPontuacaoForNegativeValue() {
        // Given
        let maiorPontuacaoSalva: Int = -500
        
        // When
        let result = homeVC.getMaiorPontuacao(maiorPontuacaoSalva: maiorPontuacaoSalva)
        
        // Then
        XCTAssertEqual(result, "R$ 0,00")
    }
    
}
