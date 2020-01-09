//
//  GradientView.swift
//  Rang
//
//  Created by JD Patel on 26/11/19.
//  Copyright © 2019 JD. All rights reserved.
//

import SwiftUI

struct GradientView: View {
    
    //Target Color RGB
    
    @State var lrTarget = Double.random(in: 0..<1)
    @State var lgTarget = Double.random(in: 0..<1)
    @State var lbTarget = Double.random(in: 0..<1)
    
    @State var rrTarget = Double.random(in: 0..<1)
    @State var rgTarget = Double.random(in: 0..<1)
    @State var rbTarget = Double.random(in: 0..<1)
    
    
    //Guess Color RGB
    
    @State var lrGuess: Double = 0.2
    @State var lgGuess: Double = 0.2
    @State var lbGuess: Double = 0.2
    
    @State var rrGuess: Double = 0.6
    @State var rgGuess: Double = 0.6
    @State var rbGuess: Double = 0.6
    
    
    @State var showAlert = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack {
                    
                    VStack {
                        
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.clear)
                            .background(LinearGradient(gradient:  Gradient(colors: [Color(red: lrTarget, green: lgTarget, blue: lbTarget, opacity: 1.0), Color(red: rrTarget, green: rgTarget, blue: rbTarget, opacity: 1.0)]), startPoint: .leading, endPoint: .trailing)).cornerRadius(10)
                            .onTapGesture {
                                self.resetRangs()
                            }
                        
                        Text("Match this Gradient")
                        
                        Divider()
                        
                        Spacer(minLength: 20)
                        
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.clear)
                            .background(LinearGradient(gradient:  Gradient(colors: [Color(red: lrGuess, green: lgGuess, blue: lbGuess, opacity: 1.0), Color(red: rrGuess, green: rgGuess, blue: rbGuess, opacity: 1.0)]), startPoint: .leading, endPoint: .trailing)).cornerRadius(10)
                        
//                        HStack {
//
//                            Text("R: \(Int(lrGuess * 255.0))").foregroundColor(.red)
//                            Text("G: \(Int(lgGuess * 255.0))").foregroundColor(.green)
//                            Text("B: \(Int(lbGuess * 255.0))").foregroundColor(.blue)
//
//                            Spacer()
//
//                            Text("R: \(Int(rrGuess * 255.0))").foregroundColor(.red)
//                            Text("G: \(Int(rgGuess * 255.0))").foregroundColor(.green)
//                            Text("B: \(Int(rbGuess * 255.0))").foregroundColor(.blue)
//
//                        }.padding(5)
//                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30)
                        
                        Spacer(minLength: 16)
                        
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack {
                                Spacer()
                                ColorSlider(value: $lrGuess, textColor: .red)
                                Spacer()
                                ColorSlider(value: $lgGuess, textColor: .green)
                                Spacer()
                                ColorSlider(value: $lbGuess, textColor: .blue)
                                Spacer()
                            }.background(Color(.quaternarySystemFill).cornerRadius(10))
                            
                            VStack {
                                Spacer()
                                ColorSlider(value: $rrGuess, textColor: .red)
                                Spacer()
                                ColorSlider(value: $rgGuess, textColor: .green)
                                Spacer()
                                ColorSlider(value: $rbGuess, textColor: .blue)
                                Spacer()
                            }.background(Color(.quaternarySystemFill).cornerRadius(10))
                        }.padding(0)
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150)
                    
                }
                .padding()
                
                Button(action: {
                    self.showAlert = true
                }) {
                    Text("Calculate Gradient")
                        .fontWeight(.regular)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(5)
                        .font(.headline)
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Your Gradient Score"), message: Text("\(computeScore())"), dismissButton: .default(Text("OK"), action: {
                        self.resetRangs()
                    }))
                }
                .padding([.leading, .trailing, .bottom], 16)
                
            }
            .background(Color(.secondarySystemBackground))
            .navigationBarTitle(Text("Gradient"), displayMode: .large)
            
        }
        
    }
    
    private func computeScore() -> Int {
        
        let lrDiff = lrGuess - lrTarget
        let lgDiff = lgGuess - lgTarget
        let lbDiff = lbGuess - lbTarget
        
        let rrDiff = rrGuess - rrTarget
        let rgDiff = rgGuess - rgTarget
        let rbDiff = rbGuess - rbTarget
        
        let diff = sqrt(lrDiff * lrDiff + lgDiff * lgDiff + lbDiff * lbDiff + rrDiff * rrDiff + rgDiff * rgDiff + rbDiff * rbDiff)
        let score = Int((1.0 - diff) * 100.0 + 0.5)
        return score > 0 ? score : 0
        
    }
    
    private func resetRangs() {
        
//        withAnimation {
            
            self.lrGuess = 0.2
            self.lgGuess = 0.2
            self.lbGuess = 0.2
            
            self.rrGuess = 0.6
            self.rgGuess = 0.6
            self.rbGuess = 0.6
            
            lrTarget = Double.random(in: 0..<1)
            lgTarget = Double.random(in: 0..<1)
            lbTarget = Double.random(in: 0..<1)
            
            rrTarget = Double.random(in: 0..<1)
            rgTarget = Double.random(in: 0..<1)
            rbTarget = Double.random(in: 0..<1)
            
//        }
        
    }
    
}
