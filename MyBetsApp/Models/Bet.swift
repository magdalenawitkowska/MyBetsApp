//
//  Bet.swift
//  MyBetsApp
//
//  Created by Magdalena Witkowska on 30.01.2018.
//  Copyright © 2018 Jones, Oliver. All rights reserved.
//

import Foundation

struct Bet: Codable {
    var betName: String?
    var subEventName: String?
    var marketName: String?
   // var channelLogo: String?
    var totalBetStake: String?
    var odds: String?
    var potentialWinnings: String?
}
