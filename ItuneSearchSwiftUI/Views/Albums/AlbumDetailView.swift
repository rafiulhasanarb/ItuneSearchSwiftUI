//
//  AlbumDetailView.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 21/6/23.
//

import SwiftUI

struct AlbumDetailView: View {
    
    let album: Album
    
    @StateObject var songsViewModel: SongsForAlbumListViewModel
    
    init(album: Album) {
        //print("init album detail \(album.id)")
        self.album = album
        self._songsViewModel = StateObject(wrappedValue: SongsForAlbumListViewModel(albumID: album.id))
    }
    
    var body: some View {
        VStack {
            AlbumHeaderDetailView(album: album)
            
            SongsForAlbumListView(songsViewModel: songsViewModel,
                                  selectedSong: nil)
        }
        .onAppear {
            songsViewModel.fetch()
        }
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album.example())
    }
}
