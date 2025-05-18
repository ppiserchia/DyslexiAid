//
//  WarningView.swift
//  DyslexiAid
//
//  Created by Lorenzo Tarabelli on 13/11/24.
//

import SwiftUI
import Vision
import UIKit

struct WarningView: View {
    @State private var showCamera = false
    @State private var capturedImage: UIImage? = nil
    @State private var wordCount: Int = 0
    @State private var analysisResult: String = ""
    @State private var navigateToPositiveView: Bool = false // For PositiveView
    @State private var navigateToNegativeResultView: Bool = false // For NegativeResultView
    
    var body: some View {

            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                
                VStack {
                    Image("warning")
                        .padding(50)
                    
                    Text("IMPORTANT")
                        .font(.custom("OpenDyslexic-Bold", size: 21))
                        .foregroundStyle(.black)
                    
                    Text("""
                         Keep your 
                         iPhone vertically 
                         from the sheet
                         """)
                    .font(.custom("OpenDyslexic-Regular", size: 21))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
                    
                    NavigationLink(
                        destination: CameraScannerView(
                            capturedImage: $capturedImage,
                            wordCount: $wordCount,
                            analysisResult: $analysisResult,
                            navigateToPositiveView: $navigateToPositiveView,
                            navigateToNegativeResultView: $navigateToNegativeResultView
                        ),
                        isActive: $showCamera
                    ) {
                        Text("I'm ready!")
                            .font(.custom("OpenDyslexic-Bold", size: 18))
                            .padding(15)
                            .foregroundStyle(.white)
                            .background(.black)
                            .cornerRadius(10)
                            .clipShape(RoundedRectangle(cornerRadius: 30.0))
                            .padding(25)
                    }
                    
                    
                }
                
                // Navigation divided in two:
//                1) If the words in the captured image are ≤ 150:
                NavigationLink(
                    destination: PositiveView(wordCount: $wordCount),
                    isActive: $navigateToPositiveView
                ) {
                    EmptyView()
                }
                
//               2) If the words in the captured image are > 150:
                NavigationLink(
                    destination: NegativeView(wordCount: $wordCount), isActive: $navigateToNegativeResultView
                ) {
                    EmptyView()
                }
            }
        
    }
}

struct CameraScannerView: UIViewControllerRepresentable {
    @Binding var capturedImage: UIImage?
    @Binding var wordCount: Int
    @Binding var analysisResult: String
    @Binding var navigateToPositiveView: Bool // Stato per NextView
    @Binding var navigateToNegativeResultView: Bool // Stato per NegativeResultView
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraScannerView
        
        init(_ parent: CameraScannerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.capturedImage = image
                parent.performTextRecognition(on: image) // Avvia l'OCR
            }
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

extension CameraScannerView {
    func performTextRecognition(on image: UIImage) {
        guard let cgImage = image.cgImage else {
            analysisResult = "Error processing image"
            return
        }
        
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                self.analysisResult = "Text recognition error: \(error.localizedDescription)"
                return
            }
            
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                self.analysisResult = "No text recognized"
                return
            }
            
            // Estrai il testo riconosciuto e conta le parole
            let recognizedText = observations.compactMap { $0.topCandidates(1).first?.string }.joined(separator: " ")
            let words = recognizedText.split { $0.isWhitespace }
            self.wordCount = words.count
            self.analysisResult = recognizedText
            
            // Controlla il numero di parole e naviga verso la view appropriata
            DispatchQueue.main.async {
                if self.wordCount <= 160 {
                    self.navigateToPositiveView = true
                } else {
                    self.navigateToNegativeResultView = true
                }
            }
        }
        
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = false
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        do {
            try handler.perform([request])
        } catch {
            self.analysisResult = "Failed to process image: \(error.localizedDescription)"
        }
    }
}

// Positive View
struct PositiveView: View {
    @State var PassToTipsView: Bool = false
    @Binding var wordCount: Int
    
    var body: some View {
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
            
                    Text("Word count: \(wordCount)")
                        .font(.custom("OpenDyslexic-Regular", size: 20))
                        .foregroundStyle(.black)
                        .padding()
                    
                
                Button("See some tips!") {
                    PassToTipsView = true
                }
                .font(.custom("OpenDyslexic-Bold", size: 18))
                .padding(15)
                .foregroundStyle(.white)
                .background(.black)
                .cornerRadius(10)
                .clipShape(RoundedRectangle(cornerRadius: 30.0))
                .padding(25)
                NavigationLink(destination: TipsView(), isActive: $PassToTipsView)
                                {
                }
                
            }
        }
    }
}

// NegativeView
struct NegativeView: View {
@State var PassToTipsView = false
    @Binding var wordCount: Int
    var body: some View {
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
                
                
                    Text("Word count: \(wordCount)")
                        .font(.custom("OpenDyslexic-Regular", size: 20))
                        .foregroundStyle(.black)
                
                    
                Button("See some tips!") {
                    PassToTipsView = true
                }
                .font(.custom("OpenDyslexic-Bold", size: 18))
                .padding(15)
                .foregroundStyle(.white)
                .background(.black)
                .cornerRadius(10)
                .clipShape(RoundedRectangle(cornerRadius: 30.0))
                .padding(25)
                NavigationLink(destination: TipsView(), isActive: $PassToTipsView)
                                {
                }
                    }
                }
            }
    }


    



#Preview {
    WarningView()
}

