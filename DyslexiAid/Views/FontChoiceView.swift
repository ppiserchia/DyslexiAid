//
//  FontChoiceView.swift
//  DyslexiAid
//
//  Created by Pasquale Piserchia on 20/11/24.
//
import SwiftUI

struct FontChoiceView : View {
    @Binding var showModal: Bool
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        showModal = false // Closes the sheet
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                }
                .padding()
                
                Image(systemName:"textformat.size")
                    .font(.system(size: 80))
                    .padding()
                    .foregroundStyle(.black)
                
                Text("Font Choice")
                    .font(.custom("OpenDyslexic-Bold", size: 38))
                    .padding()
                    .foregroundStyle(.black)
                Spacer()
                
                
                Text("""
                 Using fonts that are not dyslexia-friendly (like can fonts with similar-looking letters) significantly hinder readability.
                 
                 Fonts that are often recommended include:
                 
                 - Open Dyslexic
                 - Arial and Helvetica
                 - Comic Sans
                 - Verdana
                 - Tahoma
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
    FontChoiceView(showModal: .constant(true))
}
