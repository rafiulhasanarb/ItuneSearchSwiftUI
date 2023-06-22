//
//  APIError.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 21/6/23.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    
    case badURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError?)
    case unknown
    
    var description: String {
        switch self {
        case .badURL:
            return AppConstents.baseURL
        case .urlSession(let error):
            return "\(AppConstents.urlSessionError): \(error.debugDescription)"
        case .badResponse(let statusCode):
            return "\(AppConstents.bedResponse): \(statusCode)"
        case .decoding(let decodingError):
            return "\(AppConstents.decodingError): \(String(describing: decodingError))"
        case .unknown:
            return AppConstents.unknownError
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .badURL, .unknown:
            return AppConstents.somethingWentWrong
        case .urlSession(let urlError):
            return urlError?.localizedDescription ?? AppConstents.somethingWentWrong
        case .badResponse(_):
            return AppConstents.somethingWentWrong
        case .decoding(let decodingError):
            return decodingError?.localizedDescription ?? AppConstents.somethingWentWrong
        }
    }
}
