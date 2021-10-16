//
//  APIError.swift
//  student689624
//
//  Created by user206790 on 10/16/21.
//

import Foundation


enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Decoden van object van de service mislukt :("
        case .errorCode(let code):
            return "Error \(code) - Oepsie woepsie, er is iets misgegaan"
        case .unknown:
            return "Onbekende error, niet best."
        }
    }
}
