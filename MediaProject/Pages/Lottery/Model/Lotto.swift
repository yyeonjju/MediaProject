//
//  Lotto.swift
//  MediaProject
//
//  Created by 하연주 on 6/6/24.
//

import Foundation

struct Lotto: Codable {
    let returnValue, drwNoDate: String?
    let totSellamnt, firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo, drwtNo5, bnusNo, firstAccumamnt, drwNo, drwtNo2, drwtNo3, drwtNo1: Int?
    
    var dateLabelText : String {
        get{
            return "\(drwNoDate ?? "0000-00-00") 추첨"
        }
    }
    
    var resultLabelText : String {
        get{
            return "\(drwNo ?? 0)회 당첨결과"
        }
    }
}
