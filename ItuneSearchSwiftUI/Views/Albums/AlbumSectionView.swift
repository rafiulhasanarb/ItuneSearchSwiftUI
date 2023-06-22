//
//  AlbumSectionView.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 21/6/23.
//

import SwiftUI

struct AlbumSectionView: View {
    
    let albums: [Album]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top) {
                ForEach(albums) { album in
                    NavigationLink {
                        AlbumDetailView(album: album)
                    } label: {
                        AlbumColumnView(album: album)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct AlbumSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSectionView(albums: [Album.example()])
    }
}
