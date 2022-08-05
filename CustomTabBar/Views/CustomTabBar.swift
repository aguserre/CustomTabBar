//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Agustin Errecalde on 02/08/2022.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tab
    let specialButtonTapped: ()->Void
    
    var body: some View {
        ZStack {
            Color.white
                .clipShape(CurveDownShape())
            HStack(spacing: 0) {
                TabBarButton(tab: .home,
                             selectedTab: self.$selectedTab)
                TabBarButton(tab: .cards,
                             selectedTab: self.$selectedTab)
                CustomTabBarButton(specialButtonTapped: self.specialButtonTapped)
                    .offset(y: -30)
                TabBarButton(tab: .crypto,
                             selectedTab: self.$selectedTab)
                TabBarButton(tab: .rewards,
                             selectedTab: self.$selectedTab)
            }
            .foregroundColor(.clear)
            .padding(.top)
            .padding(.vertical, -15)
            .padding(.bottom, self.getSafeArea().bottom == 0 ? 25 : self.getSafeArea().bottom)
        }
        .frame(height: 80)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: -2)
    }
}



struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.home), specialButtonTapped: {})
    }
}




