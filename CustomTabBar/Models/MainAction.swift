//
//  MainAction.swift
//  CustomTabBar
//
//  Created by Agustin Errecalde on 05/08/2022.
//

import Foundation

enum MainAction: CaseIterable, Identifiable {
    var id: String {String(describing: self)}

    case sendMoney
    case extractMoney
    case transferMoney
    
    var navTitle: String {
        switch self {
        case .sendMoney:
            return "Send Money"
        case .extractMoney:
            return "Extract Money"
        case .transferMoney:
            return "Transfer Money"
        }
    }

}
