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
                let decodedBets = try JSONDecoder().decode(NestedData.self, from: data)
                return (decodedBets.singleBets, nil)
            }
            catch let error {
                return ([], errorText: error.localizedDescription)
            }
        }
        return ([], "No json file found.")
    }
    
}
