//
//  ParabensVCTests.swift
//  AppESQuizTests
//
//  Created by Fernando Moreira on 04/12/23.
//

import XCTest
@testable import AppESQuiz

class ParabensVCTests: XCTestCase {
    var parabensVC: ParabensVC!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        parabensVC = storyboard.instantiateViewController(withIdentifier: "ParabensVC") as? ParabensVC
        parabensVC.loadViewIfNeeded()
    }

    override func tearDown() {
        parabensVC = nil
        super.tearDown()
    }

    func testSetTitleLabel_ValorGanhoZero() {
        // Given
        let valorGanho = 0
        let result = "Tudo tem um começo!"
        
        // When
        let text = parabensVC.setTitleLabel(valorGanho: valorGanho)
        
        // Then
        XCTAssertEqual(text, result)
    }
    
    func testSetTitleLabel_ValorGanho5mil() {
        // Given
        let valorGanho = 5000
        let result = "Treine mais da próxima vez!"
        
        // When
        let text = parabensVC.setTitleLabel(valorGanho: valorGanho)
        
        // Then
        XCTAssertEqual(text, result)
    }
    
    func testSetTitleLabel_ValorGanho200mil() {
        // Given
        let valorGanho = 200000
        let result = "Bom resultado mas poderia ser melhor!"
        
        // When
        let text = parabensVC.setTitleLabel(valorGanho: valorGanho)
        
        // Then
        XCTAssertEqual(text, result)
    }
    
    func testSetTitleLabel_ValorGanho1milhao() {
        // Given
        let valorGanho = 1000000
        let result = "Parabéns!!!"
        
        // When
        let text = parabensVC.setTitleLabel(valorGanho: valorGanho)
        
        // Then
        XCTAssertEqual(text, result)
    }

    func testSetSubtitleLabel_ValorZero() {
        // Given
        let valorGanho = 0
        let result = "Você não ganhou nada!"
        
        // When
        let text = parabensVC.setSubtitleLabel(valorGanho: valorGanho)
        
        // Then
        XCTAssertEqual(text, result)
    }
    
    func testSetSubtitleLabel_Valor1Milhao() {
        // Given
        let valorGanho = 1000000
        let result = "Você ganhou 1 milhão!!!"
        
        // When
        let text = parabensVC.setSubtitleLabel(valorGanho: valorGanho)
        
        // Then
        XCTAssertEqual(text, result)
    }

    func testSetImageView_ValorZero() {
        // Given
        let valor = 0
        let result = "sem-dinheiro"
        
        // When
        let nameImg = parabensVC.setImageView(valorGanho: valor)
        
        // Then
        XCTAssertEqual(nameImg, result)
    }
    
    func testSetImageView_Valor50Mil() {
        // Given
        let valor = 50000
        let result = "dinheiro-nivel-2"
        
        // When
        let nameImg = parabensVC.setImageView(valorGanho: valor)
        
        // Then
        XCTAssertEqual(nameImg, result)
    }
    
    func testSetImageView_Valor1Milhao() {
        // Given
        let valor = 1000000
        let result = "dinheiro-1-milhao"
        
        // When
        let nameImg = parabensVC.setImageView(valorGanho: valor)
        
        // Then
        XCTAssertEqual(nameImg, result)
    }

    func testSetBackgroundImageView_ValorZero() {
        // Given
        let valor = 0
        let result = "background-sem-dinheiro"
        
        // When
        let nameImg = parabensVC.setBackgroundImageView(valorGanho: valor)
        
        // Then
        XCTAssertEqual(nameImg, result)
    }
    
    func testSetBackgroundImageView_Valor200Mil() {
        // Given
        let valor = 200000
        let result = "background-dinheiro"
        
        // When
        let nameImg = parabensVC.setBackgroundImageView(valorGanho: valor)
        
        // Then
        XCTAssertEqual(nameImg, result)
    }
    
    func testSetBackgroundImageView_Valor1Milhao() {
        // Given
        let valor = 1000000
        let result = "background-milhao"
        
        // When
        let nameImg = parabensVC.setBackgroundImageView(valorGanho: valor)
        
        XCTAssertEqual(nameImg, result)
    }

}

