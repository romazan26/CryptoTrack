//
//  UserEditCellview.swift
//  CryptoTrack
//
//  Created by Роман on 07.11.2024.
//

import SwiftUI

struct UserEditCellview: View {
    @StateObject var vm: SettingsViewModel
    var body: some View {
        HStack {
            //MARK: - Photo user
            Button {
                vm.showImagePicker = true
            } label: {
                if vm.selectedImage == nil{
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .foregroundStyle(.gray)
                }else{
                    Image(uiImage: vm.selectedImage!)
                        .resizable()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                }
            }
            
            //MARK: - Name user
            TextField("Name", text: $vm.name)
                .padding()
                .foregroundStyle(.white)
                .colorScheme(.dark)
                .background {
                    Color.white
                        .opacity(0.05)
                        .cornerRadius(8)
                }
            
            


        }.padding()
            .background {
                Color.white
                    .opacity(0.05)
                    .cornerRadius(8)
            }
    }
}

#Preview {
    ZStack {
        Color.homeBack
        UserEditCellview(vm: SettingsViewModel())
    }
}
