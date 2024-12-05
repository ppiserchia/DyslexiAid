//
//  ContentView.swift
//  DyslexiAid
//
//  Created by Lorenzo Tarabelli on 13/11/24.
//
import SwiftUI

struct ScanResult: Identifiable {
    let id = UUID()
    let image: UIImage
    let description: String
}

struct HomeView: View {
    @State private var showAlert : Bool = false
    @State private var navigateToCameraView : Bool = false
    @State private var capturedImage: UIImage? = nil
    @State private var savedResults: [ScanResult] = []
    
    var body: some View {
        NavigationView { // Aggiunge un NavigationView per abilitare la navigazione
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Let’s scan the text!")
                        .font(.custom("OpenDyslexic-Bold", size: 21))
                        .foregroundStyle(.black)
                    
                    NavigationLink(destination: WarningView()) {
                        Image("Button")
                    }
                }
            }
        }
    }
}
                    
                    /// Alert modifier
                    //                    .alert("Warning", isPresented: $showAlert) {
                    //                        Button("I'm ready!", role: .destructive) {
                    //                            navigateToCameraView = true
                    //                        }
                    //
                    //                        Button("Cancel", role: .cancel) {
                    //                            print("Cancelling action...")
                    //                        }
                    //
                    //                    } message: {
                    //                        Text("Please, keep your iPhone vertically from the sheet!")
                    //                    }
                    
                    //                    NavigationLink(destination: CameraView(capturedImage: $capturedImage), isActive: $navigateToCameraView) {
                    //                        EmptyView()
                    //                    }
                    //                }
                    //                }
                    
                    ///NavigationLink that leads to the WarningView
                    
                    
                    
                    #Preview {
                        HomeView()
                    }
            
        
