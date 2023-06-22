//
//  AppConstants.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 22/6/23.
//

import Foundation

struct AppConstents {
    //MARK: - APIService page
    static let baseURL = "https://itunes.apple.com/"
    static let searchURL = baseURL + "search"
    static let lookupURL = baseURL + "lookup"
    static let album = "album"
    static let term = "term"
    static let entity = "entity"
    static let limit = "limit"
    static let offset = "offset"
    static let id = "id"
    static let loadError = "Could not load:"
    //MARK: - APIError page
    static let badURL = "badURL"
    static let bedResponse = "bed response wth status code"
    static let decodingError = "decoding error"
    static let urlSessionError = "url session error"
    static let somethingWentWrong = "Something went wrong"
    static let unknownError = "unknown error"
    //MARK: - Entity type page
    static let all = "All"
    static let albums = "Albums"
    static let songs = "Songs"
    static let movie = "Movies"
    static let trending = "Trending"
    
    static let selectTheMedia = "Select the media"
    static let search = "Search"
    static let seeAll = "See all"
    static let searchMovies = "Search Movies"
    static let albumOnly = "ALBUM ONLY"
    static let couldNotFind = "Sorry Could not find anything."
}
