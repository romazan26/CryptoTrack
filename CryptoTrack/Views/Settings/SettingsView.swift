//
//  SettingsView.swift
//  CryptoTrack
//
//  Created by Роман on 07.11.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @StateObject var vm: SettingsViewModel
    @FocusState var keyboard: Bool
    var body: some View {
        ZStack {
            //MARK: - back ground
            Color.homeBack.ignoresSafeArea()
            
            //MARK: - Main stack
            VStack(alignment: .leading) {
                //MARK: - title view
                Text("Settings")
                    .foregroundStyle(.white)
                    .font(.system(size: 34, weight: .bold))
                
                //MARK: - Settings button group
                VStack{
                    //MARK: - Share App Button
                    Button(action: {vm.isPresentShare.toggle()}, label: {
                        SettingButtonView(text: "SHARE APP", imageName: "sun.min.fill")
                    })
                    
                    //MARK: - Rate App Button
                    Button {
                        SKStoreReviewController.requestReview()
                    } label: {
                        SettingButtonView(text: "RATE APP", imageName: "square.and.arrow.up.fill")
                    }
                    
                    //MARK: - Privacy button
                    Button(action: {
                        vm.isPresentPolicy = true
                        print("policy: \(vm.isPresentPolicy)")
                    }, label: {
                        SettingButtonView(text: "PRIVACY POLICY", imageName: "text.document.fill")
                    })
                }
                
                //MARK: - Profile
                Text("Profile")
                    .foregroundStyle(.white)
                    .font(.system(size: 28, weight: .bold))
                UserEditCellview(vm: vm)
                    .focused($keyboard)
                
                //MARK: - Quotes user
                Text("Quotes")
                    .foregroundStyle(.white)
                    .font(.system(size: 28, weight: .bold))
                MultiLineTF(txt: $vm.quotes, placehold: "Quotes")
                    .frame(height: 100)
                    .padding()
                    .background {
                        Color.white.opacity(0.05).cornerRadius(8)
                    }
                //MARK: - Save button
                Button {
                    vm.updateUser()
                } label: {
                    CustomButtonView(title: "Save profile")
                        
                }
                .disabled(vm.name.isEmpty ? true : false)
                .opacity(vm.name.isEmpty ? 0.5 : 1)

                
                Spacer()
            }
            .padding()
            .sheet(isPresented: $vm.showImagePicker) {
                ImagePicker(image: $vm.selectedImage)
            }
            .sheet(isPresented: $vm.isPresentShare, content: {
                ShareSheet(items: vm.urlShare )
            })
            
        }
        .sheet(isPresented: $vm.isPresentPolicy, content: {
            WebViewPage(urlString: URL(string:vm.urlPolicy)!)
        })
        .onTapGesture {
            keyboard = false
        }
    }
}

#Preview {
    SettingsView(vm: SettingsViewModel())
}

struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
