//
//  SongListView.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 21/6/23.
//

import SwiftUI

struct SongListView: View {
    
    @ObservedObject var viewModel: SongListViewModel
    
    var body: some View {
        
        List {
            ForEach(viewModel.songs) { song in
                NavigationLink {
                    SongDetailView(song: song)
                } label: {
                    SongRowView(song: song)
                }
            }
            
            ListPlaceholderRowView(state: viewModel.state,
                                   loadMore: viewModel.loadMore)
        }
        .listStyle(.plain)        
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(viewModel: SongListViewModel.example())
    }
}
