//
//  NestedData.swift
//  MyBetsApp
//
//  Created by Magdalena Witkowska on 30.01.2018.
//  Copyright © 2018 Jones, Oliver. All rights reserved.
//

import Foundation

struct NestedData: Codable {
    var singleBets: [Bet] = []
    var opta: [Opta] = []
}
