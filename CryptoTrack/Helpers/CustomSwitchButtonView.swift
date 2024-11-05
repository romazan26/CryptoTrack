//
//  CustomSwitchButtonView.swift
//  PixBet_Manage
//
//  Created by Роман on 28.10.2024.
//

import SwiftUI

struct CustomSwitchButtonView: View {
    @Binding var isOn: Bool
    var nameFirst: String
    var nameSecond: String
    
    var body: some View {
        HStack {
            //MARK: - First
            Button {
                isOn = true
            } label: {
                ZStack {
                    Color.white
                        .opacity(isOn ? 0.5 : 0.05)
                        .cornerRadius(7)
                    Text(nameFirst)
                        .foregroundStyle(.white)
                }
                .frame(height: 24)
                .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
            //MARK: - Second
            Button {
                isOn = false
            } label: {
                ZStack {
                    Color.white
                        .opacity(!isOn ? 0.5 : 0.05)
                        .cornerRadius(7)
                    Text(nameSecond)
                        .foregroundStyle(.white)
                }
                .frame(height: 24)
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.homeBack
        CustomSwitchButtonView(isOn: .constant(true || false), nameFirst: "List", nameSecond: "Grid")
    }
}
