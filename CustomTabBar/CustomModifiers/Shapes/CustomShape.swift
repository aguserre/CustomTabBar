//
//  CustomShape.swift
//  CustomTabBar
//
//  Created by Agustin Errecalde on 03/08/2022.
//

import SwiftUI

struct CurveDownShape: Shape {
    func path(in rect: CGRect) -> Path {
        let spacing: CGFloat = 38
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let midX = rect.width / 2
            path.move(to: CGPoint(x: midX - spacing * 1.5, y: 0))
            
            let to = CGPoint(x: midX, y: spacing)
            let control1 = CGPoint(x: midX - spacing, y: 0)
            let control2 = CGPoint(x: midX - spacing, y: spacing)
            path.addCurve(to: to, control1: control1, control2: control2)

            let to1 = CGPoint(x: midX + spacing * 1.5, y: 0)
            let control3 = CGPoint(x: midX + spacing, y: spacing)
            let control4 = CGPoint(x: midX + spacing, y:  0)
            
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}

struct CustomTabBar2_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.home), specialButtonTapped: {})
    }
}
