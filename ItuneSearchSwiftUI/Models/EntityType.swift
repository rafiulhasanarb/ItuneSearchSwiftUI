//
//  EntityType.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 21/6/23.
//

import Foundation

enum EntityType: String, Identifiable, CaseIterable {
    case all
    case album
    case song
    case movie
    
    var id: String {
        self.rawValue
    }
    
    func name() -> String {
        switch self {
        case .all:
            return AppConstents.all
        case .album:
            return AppConstents.album
        case .song:
            return AppConstents.songs
        case .movie:
            return AppConstents.movie
        }
    }
}
