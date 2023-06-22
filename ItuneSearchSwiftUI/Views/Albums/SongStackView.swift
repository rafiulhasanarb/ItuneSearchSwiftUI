//
//  SongStackView.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 22/6/23.
//

import SwiftUI

struct SongStackView: View {
    
    let songs: [Song]
    let selectedSong: Song?
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(songs) { song in
                HStack(spacing: 10) {
                    Text("\(song.trackNumber)")
                        .font(.footnote)
                        .frame(width: 25, alignment: .trailing)
                    
                    Text(song.trackName)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(TimeFormattedDuration.formattedDuration(time: song.trackTimeMillis))
                        .font(.footnote)
                        .frame(width: 40)
                    
                    BuySongButton(urlString: song.previewURL,
                                  price: song.trackPrice,
                                  currency: song.currency)
                    
                    .padding(.trailing)
                }
                .foregroundColor(selectedSong?.id == song.id ? Color.accentColor : Color.black)
                //.padding(.bottom, 10)
                .id(song.trackNumber)
                
                Divider()
            }
        }
    }
}


struct SongStackView_Previews: PreviewProvider {
    static var previews: some View {
        let songs: [Song] = []
        SongStackView(songs: songs, selectedSong: Song.example())
    }
}
