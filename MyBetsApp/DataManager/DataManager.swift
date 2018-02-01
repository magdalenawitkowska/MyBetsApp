//
//  DataManager.swift
//  MyBetsApp
//
//  Created by Magdalena Witkowska on 30.01.2018.
//  Copyright © 2018 Jones, Oliver. All rights reserved.
//

import Foundation
import UIKit

class DataManager {
    
    let jsonName = "mybets"
    
    static let instance = DataManager()
    
    //MARK: Fetching data method
    
    //Get bets from JSON or error text if retrieving data failed
    func getSingleBets() -> (singleBets: [Bet], errorText: String?) {
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return (try parseData(data: data), nil)
            }
            catch let error {
                return ([], errorText: error.localizedDescription)
            }
        }
        return ([], "No json file found.")
    }
    
    //MARK: Parser methods
    
    //Parse data from JSON
    func parseData(data: Data) throws -> [Bet] {
        var nestedData = try JSONDecoder().decode(NestedData.self, from: data)
        matchOptaToBets(nestedData: &nestedData)
        return nestedData.singleBets
    }
    
    //Get all the Opta data, transform it to dictionary and fill bet's objects with whenever data is matching (optaId)
    func matchOptaToBets(nestedData: inout NestedData) {
        var optaDictionary = [Int: String]()
        for element in nestedData.opta where element.optaId != nil {
            optaDictionary[element.optaId!] = element.timeElapsed
        }
        for (index, bet) in nestedData.singleBets.enumerated() {
            if let details = bet.singleDetails, let optaId = details.optaId, let timeElapsed = optaDictionary[optaId] {
                nestedData.singleBets[index].timeElapsed = timeElapsed
            }
        }
    }
}
