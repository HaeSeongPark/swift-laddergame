//
//  LadderGame.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

/*
 들여쓰기 depth를  1단계로 줄이기
 메소드의 라인 최대 10줄
 method가 한 가지일만 하도록
 */

import Foundation

extension Int{
    var arc4random:Int{
        return Int(arc4random_uniform(UInt32(self)))
    }
}


struct LadderGame {
    private var numberOfPerson:Int
    private var heightOfLadder:Int
    
    init(_ numberOfPerson:Int, _ heightOfLadder:Int) {
        self.numberOfPerson = numberOfPerson
        self.heightOfLadder = heightOfLadder
    }
    
    mutating func makeLadder() -> [[Bool]]{
        var ladderMatrix = Array(repeating: Array(repeating: false, count: numberOfPerson-1), count: heightOfLadder)
        let numberOfLadder = ( numberOfPerson + heightOfLadder ) / 2
        for _ in 0..<numberOfLadder{
            ladderMatrix[heightOfLadder.arc4random][(numberOfPerson-1).arc4random] = true
        }
        return ladderMatrix
    }
}
