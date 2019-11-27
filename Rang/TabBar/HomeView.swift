//
//  HomeView.swift
//  Rang
//
//  Created by JD Patel on 14/11/19.
//  Copyright © 2019 JD. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var rTarget = Double.random(in: 0..<1)
    @State var gTarget = Double.random(in: 0..<1)
    @State var bTarget = Double.random(in: 0..<1)
    
    @State var rGuess: Double = 0.5
    @State var gGuess: Double = 0.5
    @State var bGuess: Double = 0.5
    
    @State var showAlert = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack {
                    
                    VStack {
                        
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget, opacity: 1.0))
                            .onTapGesture {
                                self.resetRangs()
                        }
                        
                        Text("Match this Rang")
                        
                        Divider()
                        
                        Spacer(minLength: 20)
                        
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess, opacity: 1.0))
//                        HStack {
//                            Text("R: \(Int(rGuess * 255.0))").foregroundColor(.red)
//                            Text("G: \(Int(gGuess * 255.0))").foregroundColor(.green)
//                            Text("B: \(Int(bGuess * 255.0))").foregroundColor(.blue)
//                        }.padding(5)
//                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30)
                         
                        
                    }
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        ColorSlider(value: $rGuess, textColor: .red)
                        Spacer()
                        ColorSlider(value: $gGuess, textColor: .green)
                        Spacer()
                        ColorSlider(value: $bGuess, textColor: .blue)
                        Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150)
                    .background(Color(.quaternarySystemFill).cornerRadius(10))
                
                }
                .padding()
                
                Button(action: {
                    self.showAlert = true
                }) {
                    Text("Calculate Rang")
                        .fontWeight(.regular)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(5)
                        .font(.headline)
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Your Rang Score"), message: Text("\(computeScore())"), dismissButton: .default(Text("OK"), action: {
                        self.resetRangs()
                    }))
                }
                .padding([.leading, .trailing, .bottom], 16)
                
            }
            .background(Color(.secondarySystemBackground))
            .navigationBarTitle(Text("Rang"), displayMode: .large)
            
        }
        
    }
    
    private func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
    private func resetRangs() {
        
        withAnimation {
            
            self.rGuess = 0.5
            self.gGuess = 0.5
            self.bGuess = 0.5
            
            rTarget = Double.random(in: 0..<1)
            gTarget = Double.random(in: 0..<1)
            bTarget = Double.random(in: 0..<1)
            
        }
        
    }
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
