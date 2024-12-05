//
//  EnoughLineHeight.swift
//  DyslexiAid
//
//  Created by Pasquale Piserchia on 20/11/24.
//
import SwiftUI

struct EnoughLineHeight : View {
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
                
                Image(systemName:"arrow.up.and.down")
                    .font(.system(size: 80))
                    .padding()
                    .foregroundStyle(.black)
                
                Text("Line Spacing")
                    .font(.custom("OpenDyslexic-Bold", size: 38))
                    .padding()
                    .foregroundStyle(.black)
                Spacer()
                
                
                Text("""
                 The line height should always be 1,5 times bigger than the font size.
                 
                 This is possibly the most challenging aspect for dyslexic users. Large, unbroken sections of text can be overwhelming and extremely difficult to navigate.
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
    EnoughLineHeight(showModal: .constant(true))
}
