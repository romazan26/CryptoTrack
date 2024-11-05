//
//  CustomTabBarView.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: Int
    var body: some View {
        HStack {
            Spacer()
            
            //MARK: Home button
            Button(action: {
                selectedTab = 1
            }) {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding()
                    .foregroundColor(selectedTab == 1 ? .blue : .gray)
                    .background(selectedTab == 1 ? Color.blue.opacity(0.2) : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            Spacer()
            
            //MARK: Favorite button
            Button(action: {
                selectedTab = 2
            }) {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding()
                    .foregroundColor(selectedTab == 2 ? .blue : .gray)
                    .background(selectedTab == 2 ? Color.blue.opacity(0.2) : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            Spacer()
            
            //MARK: News button
            Button(action: {
                selectedTab = 3
            }) {
                Image(systemName: "bolt.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding()
                    .foregroundColor(selectedTab == 3 ? .blue : .gray)
                    .background(selectedTab == 3 ? Color.blue.opacity(0.2) : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            Spacer()
            
            //MARK: Settings button
            Button(action: {
                selectedTab = 4
            }) {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding()
                    .foregroundColor(selectedTab == 4 ? .blue : .gray)
                    .background(selectedTab == 4 ? Color.blue.opacity(0.2) : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .background {
            Color.white.opacity(0.05).cornerRadius(8)
        }
    }
}

#Preview {
    ZStack {
        Color.homeBack
        CustomTabBarView(selectedTab: .constant(0))
            .padding()
    }
}
