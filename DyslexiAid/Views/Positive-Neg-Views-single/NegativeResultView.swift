//
//  NegativeResultView.swift
//  DyslexiAid
//
//  Created by Pasquale Piserchia on 18/11/24.
//

import SwiftUI

struct NegativeResultView: View {
    var body : some View {
        ZStack {
            
            Color("Background")
                .ignoresSafeArea()
            
            
            VStack {
                Text("Results")
                    .font(.custom("OpenDyslexic-Bold", size: 50))
                    .foregroundStyle(.black)
                
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 150)
                    .foregroundStyle(.red)
                
                Text("""
                     You might not 
                     be able to read this book.
                     """)
                    .font(.custom("OpenDyslexic-Bold", size: 24))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                
                Text("Word count: 200")
                    .font(.custom("OpenDyslexic-Regular", size: 18))
                    .foregroundStyle(.black)
                    .padding(20)
                    .multilineTextAlignment(.center)
                
                
                
                Button("See some tips!") {
                    
                }
                .font(.custom("OpenDyslexic-Bold", size: 18))
                .padding(15)
                .foregroundStyle(.white)
                .background(.black)
                .cornerRadius(10)
                .clipShape(RoundedRectangle(cornerRadius: 30.0))
                .padding(40)
            }
        }
    }
}


#Preview {
    NegativeResultView()
}
