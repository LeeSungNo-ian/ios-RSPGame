//
//  ComputerOptionSelector.swift
//  ios-RSPGame
//
//  Created by 이성노 on 2021/12/09.
//

import Foundation

struct ComputerSelectRandomHandShape {
    func computerRandomOptionSelector() -> HandShape {
        let randomNumber = Int.random(in: 0...2)
        if let computerRandomHandShape = HandShape(rawValue: randomNumber) {
            return computerRandomHandShape
        }
        return HandShape.paper
    }
}
