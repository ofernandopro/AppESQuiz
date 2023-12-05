//
//  EliminarAltsVCE2ETests.swift
//  AppESQuizTests
//
//  Created by Fernando Moreira on 04/12/23.
//

import XCTest
@testable import AppESQuiz

class EliminarAltsVCE2ETests: XCTestCase {
    
    var eliminarAltsVC: EliminarAltsVC!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        eliminarAltsVC = storyboard.instantiateViewController(withIdentifier: "EliminarAltsVC") as? EliminarAltsVC
        eliminarAltsVC.loadViewIfNeeded()
    }
    
    override func tearDown() {
        eliminarAltsVC = nil
        super.tearDown()
    }
    
    func testOnTapCard1View() {
        // Given
        eliminarAltsVC.qntAltsEliminadas = 0
        
        // When
        eliminarAltsVC.onTapCard1View()
        
        // Then
        XCTAssertEqual(eliminarAltsVC.card1Label.isHidden, false, "Card1Label should be visible")
        XCTAssertGreaterThanOrEqual(eliminarAltsVC.qntAltsEliminadas, 0, "qntAltsEliminadas should be greater than or equal to 0")
    }
    
    func testOnTapCard2View() {
        // Given
        eliminarAltsVC.qntAltsEliminadas = 0
        
        // When
        eliminarAltsVC.onTapCard2View()
        
        // Then
        XCTAssertEqual(eliminarAltsVC.card2Label.isHidden, false, "Card2Label should be visible")
        XCTAssertGreaterThanOrEqual(eliminarAltsVC.qntAltsEliminadas, 0, "qntAltsEliminadas should be greater than or equal to 0")
    }
    
    func testOnTapCard3View() {
        // Given
        eliminarAltsVC.qntAltsEliminadas = 0
        
        // When
        eliminarAltsVC.onTapCard3View()
        
        // Then
        XCTAssertEqual(eliminarAltsVC.card3Label.isHidden, false, "Card3Label should be visible")
        XCTAssertGreaterThanOrEqual(eliminarAltsVC.qntAltsEliminadas, 0, "qntAltsEliminadas should be greater than or equal to 0")
    }
    
    func testOnTapCard4View() {
        // Given
        eliminarAltsVC.qntAltsEliminadas = 0
        
        // When
        eliminarAltsVC.onTapCard4View()
        
        // Then
        XCTAssertEqual(eliminarAltsVC.card4Label.isHidden, false, "Card4Label should be visible")
        XCTAssertGreaterThanOrEqual(eliminarAltsVC.qntAltsEliminadas, 0, "qntAltsEliminadas should be greater than or equal to 0")
    }
    
    
}
