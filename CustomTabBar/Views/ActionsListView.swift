//
//  ActionsListView.swift
//  CustomTabBar
//
//  Created by Agustin Errecalde on 05/08/2022.
//

import SwiftUI

struct ActionsListView: View {
    
    @Binding var showActions: Bool
    var actionTapped: (MainAction) -> Void
    
    var body: some View {
        ZStack {
            if self.showActions {
                ZStack(alignment: .bottom) {
                    Color.black
                        .opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            self.showActions = false
                        }
                    VStack(spacing: 16) {
                        ForEach(MainAction.allCases, id: \.self) { action in
                            ActionCellView(action: action) {
                                self.showActions = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    self.actionTapped(action)
                                }
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom, 60)
                    .frame(maxWidth: .infinity)
                    .background(
                        Rectangle()
                            .fill(Color.secondaryBackground)
                            .cornerRadius(8, corners: [.topLeft, .topRight])
                    )
                }
                .transition(.move(edge: .bottom))
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
    }
}

struct ActionsListView_Previews: PreviewProvider {
    static var previews: some View {
        ActionsListView(showActions: .constant(true), actionTapped: { _ in})
    }
}
