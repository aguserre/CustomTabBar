//
//  TabBarButton.swift
//  CustomTabBar
//
//  Created by Agustin Errecalde on 03/08/2022.
//

import SwiftUI

struct TabBarButton: View {
    
    let tab: Tab
    @Binding var selectedTab: Tab
    
    var body: some View {
        Button {
            self.selectedTab = self.tab
        } label: {
            VStack(spacing: 5) {
                Image(systemName: self.tab.image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(selectedTab == tab ? Color.primaryRed : .gray)
                    .frame(width: 25, height: 25)
                Text(self.tab.title)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(selectedTab == tab ? Color.primaryRed : .gray)
            }.frame(maxWidth: .infinity)
        }
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TabBarButton(tab: .home, selectedTab: .constant(.home))
            TabBarButton(tab: .rewards, selectedTab: .constant(.home))
        }

    }
}
