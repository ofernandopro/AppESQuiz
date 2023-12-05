//
//  UniversitariosVCTests.swift
//  AppESQuizTests
//
//  Created by Fernando Moreira on 04/12/23.
//

import XCTest
@testable import AppESQuiz

class UniversitariosVCTests: XCTestCase {
    
    var universitariosVC: UniversitariosVC!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        universitariosVC = storyboard.instantiateViewController(withIdentifier: "UniversitariosVC") as? UniversitariosVC
        universitariosVC.loadViewIfNeeded()
    }

    override func tearDown() {
        universitariosVC = nil
        super.tearDown()
    }

    func testSetLabelsTemaHumanasFirstLabel() {
        // Given
        let randomNum = 0
        let altCorreta = 1
        let nivel = 3
        
        // When
        let result = universitariosVC.setLabelsTemaHumanas(randomNum: randomNum, altCorreta: altCorreta, nivel: nivel)
        
        // Then
        XCTAssertEqual(result.0, "A")
    }
    
    func testSetLabelsTemaHumanasSecondLabel() {
        // Given
        let randomNum = 0
        let altCorreta = 1
        let nivel = 3
        
        // When
        let result = universitariosVC.setLabelsTemaHumanas(randomNum: randomNum, altCorreta: altCorreta, nivel: nivel)
        
        // Then
        XCTAssertEqual(result.1, "A")
    }
    
    func testSetLabelsTemaHumanasThirdLabel() {
        // Given
        let randomNum = 0
        let altCorreta = 1
        let nivel = 3
        
        // When
        let result = universitariosVC.setLabelsTemaHumanas(randomNum: randomNum, altCorreta: altCorreta, nivel: nivel)
        
        // Then
        XCTAssertEqual(result.2, "B")
    }

    func testSetLabelsTemaNaturezasFirstLabel() {
        // Given
        let randomNum = 1
        let altCorreta = 3
        let nivel = 2
        
        // When
        let result = universitariosVC.setLabelsTemaNaturezas(randomNum: randomNum, altCorreta: altCorreta, nivel: nivel)
        
        // Then
        XCTAssertEqual(result.0, "C")
    }
    
    func testSetLabelsTemaNaturezasSecondLabel() {
        // Given
        let randomNum = 1
        let altCorreta = 3
        let nivel = 2
        
        // When
        let result = universitariosVC.setLabelsTemaNaturezas(randomNum: randomNum, altCorreta: altCorreta, nivel: nivel)
        
        // Then
        XCTAssertEqual(result.1, "C")
    }
    
    func testSetLabelsTemaNaturezasThirdLabel() {
        // Given
        let randomNum = 1
        let altCorreta = 3
        let nivel = 2
        
        // When
        let result = universitariosVC.setLabelsTemaNaturezas(randomNum: randomNum, altCorreta: altCorreta, nivel: nivel)
        
        // Then
        XCTAssertEqual(result.2, "C")
    }

    func testSetLabelsTemaExatasFirstLabel() {
        // Given
        let randomNum = 0
        let altCorreta = 2
        let nivel = 4
        
        // When
        let result = universitariosVC.setLabelsTemaExatas(randomNum: randomNum, altCorreta: altCorreta, nivel: nivel)
        
        // Then
        XCTAssertEqual(result.0, "B")
    }
    
    func testSetLabelsTemaExatasSecondLabel() {
        // Given
        let randomNum = 0
        let altCorreta = 2
        let nivel = 4
        
        // When
        let result = universitariosVC.setLabelsTemaExatas(randomNum: randomNum, altCorreta: altCorreta, nivel: nivel)
        
        // Then
        XCTAssertEqual(result.1, "B")
    }
    
    func testSetLabelsTemaExatasThirdLabel() {
        // Given
        let randomNum = 0
        let altCorreta = 2
        let nivel = 4
        
        // When
        let result = universitariosVC.setLabelsTemaExatas(randomNum: randomNum, altCorreta: altCorreta, nivel: nivel)

        // Then
        XCTAssertEqual(result.2, "A")
    }

    func testSetLabelsTemaGeralFirstLabel() {
        // Given
        let num = 2
        let altCorreta = 4
        
        // When
        let result = universitariosVC.setLabelsTemaGeral(num: num, altCorreta: altCorreta)
        
        // Then
        XCTAssertEqual(result.0, "C")
    }
    
    func testSetLabelsTemaGeralSecondLabel() {
        // Given
        let num = 2
        let altCorreta = 4
        
        // When
        let result = universitariosVC.setLabelsTemaGeral(num: num, altCorreta: altCorreta)

        // Then
        XCTAssertEqual(result.1, "B")
    }
    
    func testSetLabelsTemaGeralThirdLabel() {
        // Given
        let num = 2
        let altCorreta = 4
        
        // When
        let result = universitariosVC.setLabelsTemaGeral(num: num, altCorreta: altCorreta)

        // Then
        XCTAssertEqual(result.2, "D")
    }

    func testGetNumAltOne() {
        // Given
        let alt = 1
        let result = "A"
        
        // When
        let numAlt = universitariosVC.getNumAlt(alt: alt)
        
        // Then
        XCTAssertEqual(numAlt, result)
    }
    
    func testGetNumAltTwo() {
        // Given
        let alt = 2
        let result = "B"
        
        // When
        let numAlt = universitariosVC.getNumAlt(alt: alt)
        
        // Then
        XCTAssertEqual(numAlt, result)
    }
    
    func testGetNumAltThree() {
        // Given
        let alt = 3
        let result = "C"
        
        // When
        let numAlt = universitariosVC.getNumAlt(alt: alt)
        
        // Then
        XCTAssertEqual(numAlt, result)
    }
    
    func testGetNumAltFour() {
        // Given
        let alt = 4
        let result = "D"
        
        // When
        let numAlt = universitariosVC.getNumAlt(alt: alt)
        
        // Then
        XCTAssertEqual(numAlt, result)
    }

    func testGetWrongAltOne() {
        // Given
        let alt = 1
        let result = "B"
        
        // When
        let wrongAlt = universitariosVC.getWrongAlt(altCorreta: alt)
        
        // Then
        XCTAssertEqual(wrongAlt, result)
    }
    
    func testGetWrongAltTwo() {
        // Given
        let alt = 2
        let result = "A"
        
        // When
        let wrongAlt = universitariosVC.getWrongAlt(altCorreta: alt)
        
        // Then
        XCTAssertEqual(wrongAlt, result)
    }
    
    func testGetWrongAltThree() {
        // Given
        let alt = 3
        let result = "D"
        
        // When
        let wrongAlt = universitariosVC.getWrongAlt(altCorreta: alt)
        
        // Then
        XCTAssertEqual(wrongAlt, result)
    }
    
    func testGetWrongAltFour() {
        // Given
        let alt = 4
        let result = "C"
        
        // When
        let wrongAlt = universitariosVC.getWrongAlt(altCorreta: alt)
        
        // Then
        XCTAssertEqual(wrongAlt, result)
    }

    func testGetAnotherWrongAltOne() {
        // Given
        let alt = 1
        let result = "C"
        
        // When
        let wrongAlt = universitariosVC.getAnotherWrongAlt(altCorreta: alt)
        
        // Then
        XCTAssertEqual(wrongAlt, result)
    }
    
    func testGetAnotherWrongAltTwo() {
        // Given
        let alt = 2
        let result = "D"
        
        // When
        let wrongAlt = universitariosVC.getAnotherWrongAlt(altCorreta: alt)
        
        // Then
        XCTAssertEqual(wrongAlt, result)
    }
    
    func testGetAnotherWrongAltThree() {
        // Given
        let alt = 3
        let result = "A"
        
        // When
        let wrongAlt = universitariosVC.getAnotherWrongAlt(altCorreta: alt)
        
        // Then
        XCTAssertEqual(wrongAlt, result)
    }
    
    func testGetAnotherWrongAltFour() {
        // Given
        let alt = 4
        let result = "B"
        
        // When
        let wrongAlt = universitariosVC.getAnotherWrongAlt(altCorreta: alt)
        
        // Then
        XCTAssertEqual(wrongAlt, result)
    }
    
}
