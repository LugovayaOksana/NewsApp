//
//  ResultState.swift
//  NewsApp
//
//  Created by Оксана on 09.11.2021.
//

import Foundation
import SwiftUI

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
