//
//  AlbumListView.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 21/6/23.
//

import SwiftUI

struct AlbumListView: View {
    
    @ObservedObject var viewModel: AlbumListViewModel
    
    var body: some View {
        
        List {
            ForEach(viewModel.albums) { album in
                NavigationLink {
                    AlbumDetailView(album: album)
                } label: {
                    AlbumRowView(album: album)
                }

            }
            
            ListPlaceholderRowView(state: viewModel.state,
                                   loadMore: viewModel.loadMore)
        }
        .listStyle(.plain)
        
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AlbumListView(viewModel: AlbumListViewModel.example())
        }       
    }
}
