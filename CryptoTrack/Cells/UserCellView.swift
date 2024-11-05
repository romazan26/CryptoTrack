//
//  UserCellView.swift
//  CryptoTrack
//
//  Created by Роман on 05.11.2024.
//

import SwiftUI

struct UserCellView: View {
    @State var user: User
    var body: some View {
        HStack {
            //MARK: - Photo user
            if let dataImage = user.photo{
                if let image = Image(data: dataImage) {
                    image
                        .resizable()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .padding()
                       
                }
            }else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundStyle(.main)
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .cornerRadius(100)
                    .padding()
                   
            }
            
            //MARK: - Name
            VStack(alignment: .leading){
                Text(user.name)
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .bold))
                Text(user.quotes)
                    .foregroundStyle(.gray)
                    .font(.system(size: 13))
            }
            Spacer()
        }
        .background {
            Image(.backUser)
                .resizable()
                .cornerRadius(8)
        }
    }
}

#Preview {
    ZStack {
        Color.homeBack
        UserCellView(user: User(name: "Hiltom", photo: nil, quotes: "The future of finance is in your hands: discover the world of cryptocurrencies!"))
            .padding()
    }
}
