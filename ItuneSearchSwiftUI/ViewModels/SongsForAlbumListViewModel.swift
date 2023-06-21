//
//  SongsForAlbumListViewModel.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 21/6/23.
//

import Foundation

class SongsForAlbumListViewModel: ObservableObject {
    
    @Published  var songs = [Song]()
    @Published var state: FetchState = .good
    
    let albumID: Int    
    private let service = APIService()
    
    init(albumID: Int) {
        self.albumID = albumID
        print("init for songs for album \(albumID)")
    }
    
    func fetch() {
        fetchSongs(for: albumID)
    }
    
    private func fetchSongs(for albumID: Int) {
        service.fetchSongs(for: albumID) {[weak self]  result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    var songs = results.results
                    
                    if results.resultCount > 0 {
                        _ = songs.removeFirst()
                    }
                    
                    self?.songs = songs
                    self?.state = .good
                    //print("fetched \(results.resultCount) songs for albumID: \(albumID)")                    
                case .failure(let error):
                    //print("Could not load: \(error)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    static func example() -> SongsForAlbumListViewModel {
        let vm = SongsForAlbumListViewModel(albumID: 1)
        vm.songs = [Song.example(), Song.example2()]
        return vm
    }
}
