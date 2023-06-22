//
//  SectionHeaderView.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 22/6/23.
//

import SwiftUI

struct SectionHeaderView<Destination>: View where Destination : View {
    
    let title: String
    let destination:  () -> Destination
    
    init(title: String, @ViewBuilder destination: @escaping () -> Destination) {
        self.title = title
        self.destination = destination
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
            Spacer()
            
            NavigationLink(destination: destination) {
                HStack {
                    Text(AppConstents.seeAll)
                    Image(systemName: "chevron.right")
                }
            }
        }
        .padding(.horizontal)
    }
}
/*
struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(title: <#String#>, destination: <#() -> _#>)
    }
}*/
