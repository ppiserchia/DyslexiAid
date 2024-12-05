//
//  ResultView.swift
//  DyslexiAid
//
//  Created by Pasquale Piserchia on 18/11/24.
//
import SwiftUI

struct PositiveResultView: View {
    @State var PassToTipsView: Bool = false
    var body : some View {
        NavigationView {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            
                VStack {
                    Text("Results")
                        .font(.custom("OpenDyslexic-Bold", size: 50))
                        .foregroundStyle(.black)
                    
                    
                    Image(systemName: "checkmark.seal.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 150)
                        .foregroundStyle(.green)
                    
                    
                    Text("""
                     All good! 
                     You can read this book.
                     """)
                    .font(.custom("OpenDyslexic-Bold", size: 24))
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    
                    
                    Text("Word count: 100")
                        .font(.custom("OpenDyslexic-Regular", size: 18))
                        .foregroundStyle(.black)
                    
                    
                    
                    
                    Button("See some tips!") {
                        
                    }
                    .font(.custom("OpenDyslexic-Bold", size: 18))
                    .padding(15)
                    .foregroundStyle(.white)
                    .background(.black)
                    .cornerRadius(10)
                    .clipShape(RoundedRectangle(cornerRadius: 30.0))
                    .padding(40)
                    
                    NavigationLink(
                        destination: TipsView(),
                        isActive: $PassToTipsView
                    ) {
                        EmptyView()
                    }
                            }
                        }
                    }
                    
                }
            }
       
    
    
    #Preview {
        PositiveResultView()
    }

    

