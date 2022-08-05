//
//  Tab.swift
//  CustomTabBar
//
//  Created by Agustin Errecalde on 05/08/2022.
//

import Foundation

enum Tab {
    case home
    case cards
    case crypto
    case rewards
    
    var image: String {
        switch self {
        case .home:
            return "house"
        case .cards:
            return "creditcard"
        case .crypto:
            return "dollarsign.circle"
        case .rewards:
            return "graduationcap"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .cards:
            return "Cards"
        case .crypto:
            return "Crypto"
        case .rewards:
            return "Rewards"
        }
    }
}
