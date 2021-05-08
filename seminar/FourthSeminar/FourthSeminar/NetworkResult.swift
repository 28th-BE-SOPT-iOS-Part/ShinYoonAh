//
//  NetworkResult.swift
//  FourthSeminar
//
//  Created by SHIN YOON AH on 2021/05/08.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
