//
//  PageIntroView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct PageIntroView: View {
    var page: PageIntro
    
    var body: some View {

        ZStack(alignment: .top) {
            
            Image(page.imageUrl)
                .resizable()
                .ignoresSafeArea()
            Text(page.text)
                .font(.system(size: 34, weight: .heavy))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 50)
                .padding(.horizontal)
        }
                        
 
    }
}


#Preview {
    PageIntroView(page: PageIntro.samplePage)
}
