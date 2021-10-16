//
//  ResultState.swift
//  student689624
//
//  Created by user206790 on 10/16/21.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
