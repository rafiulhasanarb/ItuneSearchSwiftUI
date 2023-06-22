//
//  SearchAllListView.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 21/6/23.
//

import SwiftUI

struct SearchAllListView: View {
    
    @ObservedObject var albumListViewModel: AlbumListViewModel
    @ObservedObject var songListViewModel: SongListViewModel
    @ObservedObject var movieListViewModel: MovieListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 5) {
                
                if songListViewModel.songs.count > 0 {
                    SectionHeaderView(title: AppConstents.songs) {
                        SongListView(viewModel: songListViewModel)
                    }
                    .padding(.top)
                    
                    SongSectionView(songs: songListViewModel.songs)
                    
                    Divider()
                        .padding(.bottom)
                }
                
                if albumListViewModel.albums.count > 0 {
                    SectionHeaderView(title: AppConstents.album) {
                        AlbumListView(viewModel: albumListViewModel)
                    }
                    
                    AlbumSectionView(albums: albumListViewModel.albums)
                    
                    Divider()
                        .padding(.bottom)
                }
                
                if movieListViewModel.movies.count > 0 {
                    SectionHeaderView(title: AppConstents.movie) {
                        MovieListView(viewModel: movieListViewModel)
                    }
                    
                    MovieSectionView(movies: movieListViewModel.movies)
                }
            }
        }
    }
}

struct SearchAllListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAllListView(albumListViewModel: AlbumListViewModel.example(),
                          songListViewModel: SongListViewModel.example(),
                          movieListViewModel: MovieListViewModel.example())
    }
}
