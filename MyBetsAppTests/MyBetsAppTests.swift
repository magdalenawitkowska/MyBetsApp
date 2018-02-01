//
//  MyBetsAppTests.swift
//  MyBetsAppTests
//
//  Created by Jones, Oliver on 06/03/2017.
//  Copyright © 2017 Jones, Oliver. All rights reserved.
//

import XCTest
@testable import MyBetsApp

class MyBetsAppTests: XCTestCase {
    
    var dataManager = DataManager.instance
    
    var opta1: Opta!
    var opta2: Opta!
    
    var bet1Details: BetDetails!
    var bet1: Bet!
    var bet2: Bet!
    
    var incompleteJSON = """
        {
            "singleBets":[{
                "totalBetStake":"0.03",
                "potentialWinnings":"0.05",
                "betDetails": [
                    {
                        "betName":"Sevilla"
                    }
                ]
            }],
            "opta": []
        }
        """
    
    override func setUp() {
        super.setUp()
        
        opta1 = Opta(optaId: 1, timeElapsed: "89")
        opta2 = Opta(optaId: 2, timeElapsed: "90")
        
        bet1Details = BetDetails(betName: "Sevilla", subeventName: "Sevilla vs Atletic Bilbao", marketName: "Winner", odds: "4/6", optaId: 1, broadcast: nil)
        bet1 = Bet(totalBetStake: "0.03", potentialWinnings: "0.05", betDetails: [bet1Details], timeElapsed: nil)
        bet2 = Bet(totalBetStake: "0.03", potentialWinnings: "0.05", betDetails: [bet1Details], timeElapsed: nil)
    }
    
    override func tearDown() {
        super.tearDown()
        
        opta1 = nil
        opta2 = nil
        
        bet1Details = nil
        bet1 = nil
        bet2 = nil
        
        incompleteJSON = ""
    }
    
    func testJSONParser() {
        var bets: [Bet]?
        if let data = incompleteJSON.data(using: .utf8) {
            bets = try? dataManager.parseData(data: data)
        }
        
        XCTAssertNotNil(bets, "JSON data is not parsed correctly")
        XCTAssertEqual(bets?.first?.singleDetails?.betName, "Sevilla", "JSON data is not parsed correctly")
        XCTAssertEqual(bets?.first?.totalBetStake, "0.03", "JSON data is not parsed correctly")
        XCTAssertEqual(bets?.first?.potentialWinnings, "0.05", "JSON data is not parsed correctly")
        
        
    }
    
    func testOptaDataIsMappedToBets() {
        
        var nestedData = NestedData(singleBets: [bet1], opta: [opta1, opta2])
        dataManager.matchOptaToBets(nestedData: &nestedData)
        
        let message = "Opta data is mapped incorrectly"
        XCTAssertEqual(opta1.timeElapsed, nestedData.singleBets.first?.timeElapsed, message)
        XCTAssertNil(bet2.timeElapsed, message)
    }
    
    func testMappingPerformance() {
        self.measure {
            var nestedData = NestedData(singleBets: [bet1], opta: [opta1, opta2])
            dataManager.matchOptaToBets(nestedData: &nestedData)
        }
    }

    
}
