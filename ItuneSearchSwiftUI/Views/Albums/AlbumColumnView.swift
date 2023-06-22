//
//  AlbumColumnView.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 22/6/23.
//

import SwiftUI

struct AlbumColumnView: View {
    let album: Album
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageLoadingView(urlString: album.artworkUrl100, size: 100)
            Text(album.collectionName)
            Text(album.artistName)
                .foregroundColor(Color.gray)
        }
        .lineLimit(2)
        .frame(width: 100)
        .font(.caption)
    }
}

struct AlbumColumnView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumColumnView(album: Album.example())
    }
}
