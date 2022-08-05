//
//  InitialHeaderView.swift
//  CustomTabBar
//
//  Created by Agustin Errecalde on 05/08/2022.
//

import SwiftUI

struct InitialHeaderView: View {
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack(alignment: .center) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Bart Simpson")
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)
                }
            }
            .transition(.move(edge: .top))
            .padding(.top, getSafeArea().top)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Rectangle()
                    .fill(.white)
            )
            Divider()
        }.frame(height: 100)
    }
}

struct InitialHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        InitialHeaderView()
    }
}
