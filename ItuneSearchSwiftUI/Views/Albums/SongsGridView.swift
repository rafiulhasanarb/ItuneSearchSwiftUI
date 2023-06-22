//
//  SongsGridView.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 22/6/23.
//

import SwiftUI

struct SongsGridView: View {
    
    let songs: [Song]
    let selectedSong: Song?
    
    var body: some View {
        Grid(horizontalSpacing: 20) {
            ForEach(songs) { song in
                GridRow {
                    Text("\(song.trackNumber)")
                        .font(.footnote)
                        .gridColumnAlignment(.trailing)
                    
                    Text(song.trackName)
                        .lineLimit(2)
                        .gridColumnAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(TimeFormattedDuration.formattedDuration(time: song.trackTimeMillis))
                        .font(.footnote)
                    
                    BuySongButton(urlString: song.previewURL,
                                  price: song.trackPrice,
                                  currency: song.currency)
                    .padding(.trailing)
                }
                .foregroundColor(selectedSong?.id == song.id ? Color.accentColor : Color.black)
                .id(song.trackNumber)
                
                Divider()
                    .gridCellUnsizedAxes(.horizontal)
            }
        }
        .padding([.bottom, .leading])
    }
}

struct SongsGridView_Previews: PreviewProvider {
    static var previews: some View {
        let songs: [Song] = []
        SongsGridView(songs: songs, selectedSong: Song.example())
    }
}
