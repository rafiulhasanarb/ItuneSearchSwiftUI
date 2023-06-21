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
            return "badURL"
        case .urlSession(let error):
            return "url session error: \(error.debugDescription)"
        case .badResponse(let statusCode):
            return "bad response wth status code: \(statusCode)"
        case .decoding(let decodingError):
            return "decoding error: \(String(describing: decodingError))"
        case .unknown:
            return "unknown error"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .badURL, .unknown:
            return "Something went wrong"
        case .urlSession(let urlError):
            return urlError?.localizedDescription ?? "Something went wrong"
        case .badResponse(_):
            return "Something went wrong"
        case .decoding(let decodingError):
            return decodingError?.localizedDescription ?? "Something went wrong"
        }
    }
}
