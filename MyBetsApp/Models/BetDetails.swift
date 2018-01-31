//
//  BetDetails.swift
//  MyBetsApp
//
//  Created by Magdalena Witkowska on 31.01.2018.
//  Copyright © 2018 Jones, Oliver. All rights reserved.
//

import Foundation

struct BetDetails: Codable {
    var betName: String?
    var subeventName: String?
    var marketName: String?
    var odds: String?
    var optaId: Int?
    var broadcast: Broadcast?
}
