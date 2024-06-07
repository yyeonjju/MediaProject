//
//  BoxOffice.swift
//  MediaProject
//
//  Created by 하연주 on 6/7/24.
//

import Foundation

struct BoxOffice: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Codable {
    let rnum, rank, rankInten, rankOldAndNew, movieCd, movieNm, openDt, salesAmt, salesShare, salesInten, salesChange, salesAcc, audiCnt, audiInten, audiChange, audiAcc, scrnCnt, showCnt: String
}
