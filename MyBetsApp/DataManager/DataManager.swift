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
    
    func getSingleBets() -> (singleBets: [Bet], errorText: String?) {
        
        if let path = Bundle.main.path(forResource: jsonName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                var nestedData = try JSONDecoder().decode(NestedData.self, from: data)
                matchOptaToBets(nestedData: &nestedData)
                return (nestedData.singleBets, nil)
            }
            catch let error {
                return ([], errorText: error.localizedDescription)
            }
        }
        return ([], "No json file found.")
    }
    
    func matchOptaToBets(nestedData: inout NestedData) {
        for (index, bet) in nestedData.singleBets.enumerated() {
            for opta in nestedData.opta {
                if let details = bet.singleDetails, details.optaId == opta.optaId {
                    nestedData.singleBets[index].timeElapsed = opta.timeElapsed
                }
            }
        }
    }
    
}
