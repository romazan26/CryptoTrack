//
//  AddNewsView.swift
//  CryptoTrack
//
//  Created by Роман on 06.11.2024.
//

import SwiftUI

struct AddNewsView: View {
    @StateObject var vm: NewsViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState var keyboardFocus: Bool
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.homeBack.ignoresSafeArea()
            
            //MARK: - Main stack
            VStack {
                //MARK: - Title view
                Text(vm.isEditing ? "Edit an entry" : "Add an entry")
                    .foregroundStyle(.white)
                    .font(.title2)
                
                //MARK: - Title of new News
                VStack(alignment: .leading) {
                    Text("Title")
                    TextField("text", text: $vm.simpleTitle)
                        .focused($keyboardFocus)
                        .padding(10)
                        .background {
                            Color.white.opacity(0.05).cornerRadius(10)
                        }
                }.foregroundStyle(.white)
                
                //MARK: - List Articles
                ScrollView {
                    if vm.simpleTextarticle.isEmpty {
                        NewAricleView(text: $vm.simpleText, image: $vm.simpleImage)
                            .focused($keyboardFocus)
                    }
                    ForEach(vm.simpleTextarticle.indices, id: \.self) { i in
                        NewAricleView(text: $vm.simpleTextarticle[i], image: $vm.simpleImagearticle[i])
                            .focused($keyboardFocus)
                    }
                }
                
                //MARK: - Add Articles button
                Button {
                    vm.addSimplleArticle()
                } label: {
                    CustomButtonView(title: "Add article", color: .white.opacity(0.05))
                }
                
                //MARK: - Save button
                Button {
                    if vm.isEditing{
                        vm.editNews()
                    }else{
                        vm.addNews()
                    }
                    dismiss()
                } label: {
                    CustomButtonView(title: "Save")
                }


            }.padding()
        }.onTapGesture {
            keyboardFocus = false
        }
    }
}

#Preview {
    AddNewsView(vm: NewsViewModel())
}
