//
//  ResultsView.swift
//  DyslexiAid
//
//  Created by Pasquale Piserchia on 19/11/24.
//
import SwiftUI

struct TipsView: View {
    @State private var showAlignmentSheet = false
    @State private var showFontChoiceSheet = false
    @State private var showHighContrastLevelSheet = false
    @State private var showEnoughLineHeightSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
            
                //MARK: Icon and title
                VStack {
                    VStack(spacing: 20) {
                        Image(systemName: "sparkles")
                            .font(.system(size: 60))
                            .foregroundColor(.black)
                            .padding(.top, 40)
                        Text("Tips")
                            .font(.custom("OpenDyslexic-Bold", size: 40))
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .padding(.bottom, 20)
                        
                        //MARK: List of options
                        VStack(spacing: 15) {
                            
                            //MARK: 1) Alignment Option
                            HStack {
                                Text("Alignment")
                                    .font(.custom("OpenDyslexic-Regular", size: 15))
                                    .foregroundStyle(.black)
                                    .padding(.vertical, 20)
                                    .padding(.horizontal)
                                
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.black)
                                    .padding()
                            }
                            .background(Color("lightYellow")) // Giallo ocra scuro
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .onTapGesture {
                                showAlignmentSheet = true
                            }
                            .sheet(isPresented: $showAlignmentSheet) {
                                AlignmentView(showModal: $showAlignmentSheet)
                            }
                            
                            //MARK: 2) Font Choice
                            HStack {
                                Text("Font Choice")
                                    .font(.custom("OpenDyslexic-Regular", size: 15))
                                    .foregroundStyle(.black)
                                    .padding(.vertical, 20)
                                    .padding(.horizontal)
                                
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.black)
                                    .padding()
                            }
                            .background(Color("lightYellow"))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .onTapGesture {
                                showFontChoiceSheet = true
                            }
                            .sheet(isPresented: $showFontChoiceSheet) {
                                FontChoiceView(showModal: $showFontChoiceSheet)
                                //                            }
                            }
                            
                            //MARK: 3) Contrast
                            HStack {
                                Text("Contrast")
                                    .font(.custom("OpenDyslexic-Regular", size: 15))
                                    .foregroundStyle(.black)
                                    .padding(.vertical, 20)
                                    .padding(.horizontal)
                                
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.black)
                                    .padding()
                            }
                            .background(Color("lightYellow"))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .onTapGesture {
                                showHighContrastLevelSheet = true
                            }
                            .sheet(isPresented: $showHighContrastLevelSheet) {
                                HighContrastLevel(showModal: $showHighContrastLevelSheet)
                            }
                            
                            //MARK: 4) Line Height
                            HStack {
                                Text("Line Height")
                                    .font(.custom("OpenDyslexic-Regular", size: 15))
                                    .foregroundStyle(.black)
                                    .padding(.vertical, 20)
                                    .padding(.horizontal)
                                
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.black)
                                    .padding()
                            }
                            .background(Color("lightYellow"))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .onTapGesture {
                                showEnoughLineHeightSheet = true
                            }
                            .sheet(isPresented: $showEnoughLineHeightSheet) {
                                EnoughLineHeight(showModal: $showEnoughLineHeightSheet)
                            }
                            }
                            
                            
                            
                        }
                        Spacer()
                    }
                }
            }
        }
    }

    // Preview for SwiftUI
    struct TipsView_Previews: PreviewProvider {
        static var previews: some View {
            TipsView()
                .previewDevice("iPhone 16 Pro")
        }
    }

