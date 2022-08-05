//
//  ActionCellView.swift
//  CustomTabBar
//
//  Created by Agustin Errecalde on 05/08/2022.
//

import SwiftUI

struct ActionCellView: View {
    
    let action: MainAction
    let actionTapped: () -> Void
    
    var body: some View {
        Button {
            self.actionTapped()
        } label: {
            Text(action.navTitle)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.secondaryBackground)
                .shadow(color: .black.opacity(0.2), radius: 4)
        )
    }
}

struct ActionCellView_Previews: PreviewProvider {
    static var previews: some View {
        ActionCellView(action: .extractMoney, actionTapped: { })
    }
}
