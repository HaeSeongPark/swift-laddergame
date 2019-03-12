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
    
    private var ladderGameResult:LadderGameResult
    private var heightOfLadder:Int
    private var numberOfLadder:Int = 0
    var tempRowsAndCols : [(row:Int,col:Int)] = []
    init(_ names:[String], _ heightOfLadder:Int) {
        ladderGameResult = LadderGameResult()
        for name in names{
            ladderGameResult.names.append(LadderPlayer(name: name))
        }
        self.heightOfLadder = heightOfLadder
    }
    
    mutating func makeLadder() -> LadderGameResult {
        ladderGameResult.ladderMatrix = Array(repeating: Array(repeating: false, count: ladderGameResult.names.count-1), count: heightOfLadder)
        
        numberOfLadder = ( ladderGameResult.names.count + heightOfLadder ) / 2

        while tempRowsAndCols.count < numberOfLadder {
            let tempRow = heightOfLadder.arc4random
            let tempCol = (ladderGameResult.names.count-1).arc4random
            if !isDuplicate(tempRow, tempCol) && !isConnectedBridge(tempRow, tempCol){
                tempRowsAndCols.append((tempRow,tempCol))
                ladderGameResult.ladderMatrix[tempRow][tempCol] = true
            }
        }
        return ladderGameResult
    }
    
    func isDuplicate(_ tempRow:Int, _ tempCol:Int) -> Bool{
        for tempRowAndCol in tempRowsAndCols{
            if tempRowAndCol.row == tempRow && tempRowAndCol.col == tempCol{
                return true
            }
        }
        return false
    }
    
    func isConnectedBridge(_ tempRow:Int, _ tempCol:Int) -> Bool {
        for tempRowAndCol in tempRowsAndCols{
            if tempRowAndCol.row == tempRow {
                if tempRowAndCol.col - 1 == tempCol || tempRowAndCol.col + 1 == tempCol{
                    return true
                }
            }
        }
        return false
    }
}
