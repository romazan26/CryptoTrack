//
//  SettingButtonView.swift
//  CryptoTrack
//
//  Created by Роман on 07.11.2024.
//

import SwiftUI

struct SettingButtonView: View {
            var text = ""
            var imageName = ""
            var body: some View {
                ZStack {
                    Color(.white)
                        .opacity(0.05)
                        .cornerRadius(8)
                        
                    HStack {
                        Image(systemName: imageName)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.main)
                        
                        Text(text)
                            .foregroundStyle(.white)
                            .font(.system(size: 17, weight: .bold))
                            .padding(.horizontal)
                        Spacer()
                        
                        Image(systemName: "line.diagonal.arrow")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.main)
                    }
                    .padding()
                }
                .frame(height: 56)
                .frame(maxWidth: .infinity)
            }
        }
    


#Preview {
    SettingButtonView()
}
