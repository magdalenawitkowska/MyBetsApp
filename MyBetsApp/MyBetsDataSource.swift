//
//  MyBetsDataSource.swift
//  MyBetsApp
//
//  Created by Jones, Oliver on 06/03/2017.
//  Copyright © 2017 Jones, Oliver. All rights reserved.
//

import Foundation

protocol MyBetsDataSourceDelegate: class {
    func myBetsDidLoad(result: [String:Any])
}

class MyBetsDataSource {
    var jsonFile:String = ""
    weak var delegate:MyBetsDataSourceDelegate?

    func load() {
        var result: [String:Any] = [:]
        if let path = Bundle.main.path(forResource: jsonFile, ofType: "json") {
            let jsonData = try! Data(contentsOf: URL(fileURLWithPath:path), options: .alwaysMapped)
            if let jsonResult = try! JSONSerialization.jsonObject(with: jsonData, options: []) as? [String:Any]
            {
                result = jsonResult
            }
        }
        self.delegate?.myBetsDidLoad(result: result)
    }
}
