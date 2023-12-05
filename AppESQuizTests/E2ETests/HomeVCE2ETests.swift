//
//  HomeVCE2ETests.swift
//  AppESQuizTests
//
//  Created by Fernando Moreira on 04/12/23.
//

import XCTest
@testable import AppESQuiz

class HomeVCE2ETests: XCTestCase {
    
    var homeVC: HomeVC!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        homeVC.loadViewIfNeeded()
    }
    
    override func tearDown() {
        homeVC = nil
        super.tearDown()
    }
    
    func testOnTapStartButton() {
        // Given
        let btn = homeVC.startButton ?? UIButton()
        
        // When
        homeVC.onTapStartButton(btn)
        
        // Then
        XCTAssertNotNil(homeVC.startButton, "Start button should not be nil")
        XCTAssertNotNil(homeVC.navigationController?.topViewController is QuizVC, "Navigation should push QuizVC")
    }
    
}

