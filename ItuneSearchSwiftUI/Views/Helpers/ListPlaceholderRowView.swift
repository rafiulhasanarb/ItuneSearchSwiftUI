//
//  ListPlaceholderRowView.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 21/6/23.
//

import SwiftUI

struct ListPlaceholderRowView: View {
    
    let state: FetchState
    let loadMore: () -> Void
    
    var body: some View {
        switch state {
            case .good:
                Color.clear
                    .onAppear {
                        loadMore()
                    }
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
            case .loadedAll:
                EmptyView()
            case .noResults:
            Text(AppConstents.couldNotFind)
                    .foregroundColor(.gray)
            case .error(let message):
                Text(message)
                    .foregroundColor(.pink)
        }
    }
}

struct ListPlaceholderRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListPlaceholderRowView(state: .noResults, loadMore: { })
    }
}
