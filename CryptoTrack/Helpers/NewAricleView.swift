//
//  NewAricleView.swift
//  CryptoTrack
//
//  Created by Роман on 07.11.2024.
//

import SwiftUI
import PhotosUI

struct NewAricleView: View {
    @Binding var text: String
    @Binding var image: UIImage
    @State private var isPresentImagePicker: Bool = false
    
    var config: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1
        
        return config
    }
    
    var body: some View {
        VStack {
            
            Button {
                isPresentImagePicker = true
            } label: {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
            }
            .frame(height: 200)
                .frame(maxWidth: .infinity)
            
            MultiLineTF(txt: $text, placehold: "Text")
                .frame(height: 160)
                .background {
                    Color.white.opacity(0.05).cornerRadius(12)
                }
        }.sheet(isPresented: $isPresentImagePicker) {
            PhotoPicker(configuration: config, pickerResult: $image, isPresented: $isPresentImagePicker)
        }
    }
}

#Preview {
    NewAricleView(text: .constant(""), image: .constant(.logo))
}
