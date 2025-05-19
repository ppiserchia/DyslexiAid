//
//  HighContrast.swift
//  DyslexiAid
//
//  Created by Pasquale Piserchia on 19/11/24.
//
import SwiftUI

struct AlignmentView: View {
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
                
                Image(systemName:"text.justify.leading")
                    .font(.system(size: 100))
                    .padding()
                    .foregroundStyle(.black)
               
                
                Text("Alignment")
                    .font(.custom("OpenDyslexic-Bold", size: 38))
                    .padding()
                    .foregroundStyle(.black)
                
                Text("""
                     Left-aligned text is generally preferred for its consistent and predictable spacing. 
                     
                     Justified text alignment can be problematic for readability. 
                     
                     It can reduce readability and comfort for all readers, not just those with dyslexia.
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
    AlignmentView(showModal: .constant(true))
}

