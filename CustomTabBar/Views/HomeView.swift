//
//  HomeView.swift
//  CustomTabBar
//
//  Created by Agustin Errecalde on 02/08/2022.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab: Tab = .home
    @State var showActions: Bool = false
    @State var showActionSheet: MainAction?
    @State var navigateIntoSheet: Bool = false
    @State var navigateToPush: Bool = false
    @State var hideTabBar: Bool = false
    @State var hideProfileNavBar: Bool = false

    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                if !self.hideProfileNavBar {
                    InitialHeaderView()
                }
                ZStack(alignment: .bottom) {
                    TabView {
                        NavigationView {
                            ZStack {
                                Color.primaryBackground
                                    .ignoresSafeArea()
                                ScrollView(.vertical, showsIndicators: false) {
                                    self.getViewForTab(tab: selectedTab)
                                        .navigationBarHidden(true)
                                        .onAppear {
                                            withAnimation {
                                                self.hideTabBar = false
                                                self.hideProfileNavBar = false
                                            }
                                        }
                                        .onDisappear {
                                            withAnimation {
                                                self.hideTabBar = true
                                                self.hideProfileNavBar = true
                                            }
                                        }
                                }.frame(maxWidth: .infinity)
                            }
                        }
                    }
                    if !self.hideTabBar {
                        CustomTabBar(selectedTab: self.$selectedTab) {
                            withAnimation {
                                self.showActions = true
                            }
                        }
                    }
                }
            }
            ActionsListView(showActions: self.$showActions) { actionTapped in
                self.showActionSheet = actionTapped
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(item: self.$showActionSheet, onDismiss: {
            self.showActionSheet = nil
            self.navigateIntoSheet = false
        }, content: { action in
            NavigationView {
                ScrollView {
                    VStack {
                        NavigationLink(destination: AnyView(EmptyView()),
                                       isActive: self.$navigateIntoSheet) { EmptyView() }
                        Text("\(action.navTitle) View")
                            .padding()
                        Button {
                            self.navigateIntoSheet = true
                        } label: {
                            Text("Navigate into sheet")
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(action.navTitle)
                .navigationBarItems(trailing: self.getCloseButton())
            }
        })
    }
    
    @ViewBuilder
    private func getCloseButton() -> some View {
        Button {
            self.showActionSheet = nil
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.black)
                .frame(width: 15, height: 15)
                .font(.system(size: 15, weight: .bold, design: .rounded))
        }

    }
    
    @ViewBuilder
    private func getViewForTab(tab: Tab) -> some View {
        switch tab {
        case .home:
            VStack(spacing: 16) {
                Image("ex1")
                    .resizable()
                    .scaledToFit()
                VStack(spacing: 8) {
                    Text("Learn about crypto")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image("ex2")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(6)
                        .shadow(color: .black.opacity(0.1), radius: 4)
                }
                VStack(spacing: 8) {
                    Text("Promotions and news")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image("ex3")
                        .resizable()
                        .scaledToFit()
                        .offset(x: 16)
                }
                VStack(spacing: 8) {
                    Text("My Vouchers")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image("ex4")
                        .resizable()
                        .scaledToFit()
                        .offset(x: 16)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 60)
            .padding(.bottom, getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
        case .cards:
            VStack {
                Text("Cards View")
            }.tag(tab.title)
        case .crypto:
            VStack {
                Text("Crypto View")
            }.tag(tab.title)
        case .rewards:
            VStack {
                Text("CART VIEW")
            }.tag(tab.title)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
