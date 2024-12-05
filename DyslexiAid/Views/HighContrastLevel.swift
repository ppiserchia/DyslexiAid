//
//  HighContrastLevel.swift
//  DyslexiAid
//
//  Created by Pasquale Piserchia on 20/11/24.
//

import SwiftUI

struct HighContrastLevel : View {
    @Binding var showModal: Bool
    var body: some View {
        
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        showModal = false // Chiude la sheet
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
            .padding()
                            
                
                Image(systemName:"paintpalette")
                    .font(.system(size: 80))
                    .padding()
                    .foregroundStyle(.black)
                
                Text("Contrast")
                    .font(.custom("OpenDyslexic-Bold", size: 28))
                    .padding()
                    .foregroundStyle(.black)
                    
                Text("""
                 Use dark coloured text on a light (not white) background.
                 
                 Use single colour backgrounds. Avoid background patterns or pictures and distracting surrounds.
                 
                 Use cream or a soft pastel colour. Some dyslexic people will have their colour preference.

                 """)
                .multilineTextAlignment(.leading)
                .font(.custom("OpenDyslexic-Regular", size: 17))
                .foregroundStyle(.black)
                .padding(.horizontal, 40)
                Spacer()
            }
        }
    }
}
#Preview {
    HighContrastLevel(showModal: .constant(true))
}
