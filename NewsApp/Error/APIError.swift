//
// Created by Оксана on 09.11.2021.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Faild to decode the object from the  service"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}