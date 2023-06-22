//
//  SongsForAlbumListView.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 21/6/23.
//

import SwiftUI

struct SongsForAlbumListView: View {
    
    @ObservedObject var songsViewModel: SongsForAlbumListViewModel
    let selectedSong: Song?
    
    var body: some View {
        
        ScrollViewReader { proxy in
            
            ScrollView {
                
                if songsViewModel.state == .isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                } else if songsViewModel.songs.count > 0 {
                    Group {
                        if #available(iOS 16.0, *) {
                            SongsGridView(songs: songsViewModel.songs, selectedSong: selectedSong)
                        } else {
                            SongStackView(songs: songsViewModel.songs, selectedSong: selectedSong)
                        }
                    }
                    .padding(.top, 30)
                    
                    .onAppear {
                        if let song = selectedSong {
                            withAnimation {
                                proxy.scrollTo(song.trackNumber, anchor: .center)
                            }
                        }
                    }
                }
            }
        }
    }
}

@available(iOS 16.0, *)


struct SongsForAlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        SongsForAlbumListView(songsViewModel: SongsForAlbumListViewModel.example(),
                              selectedSong: nil)
    }
}
