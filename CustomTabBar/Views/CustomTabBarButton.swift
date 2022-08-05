//
//  CustomTabBarButton.swift
//  CustomTabBar
//
//  Created by Agustin Errecalde on 03/08/2022.
//

import SwiftUI

struct CustomTabBarButton: View {
    
    let specialButtonTapped: ()->Void
    
    var body: some View {
        Button {
            self.specialButtonTapped()
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(.white)
                .padding(20)
                
        }
        .frame(width: 60, height: 60)
        .background(
            Circle()
                .fill(Color.primaryRed)
                .shadow(color: .black.opacity(0.2), radius: 5)
        )
    }
}

struct CustomTabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarButton(specialButtonTapped: {})
    }
}
