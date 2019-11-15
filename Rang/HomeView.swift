//
//  HomeView.swift
//  Rang
//
//  Created by JD Patel on 14/11/19.
//  Copyright © 2019 JD. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    @State var showAlert = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack {
                    
                    Rectangle()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget, opacity: 1.0))
                    Text("Match this Rang")
                    
                    Spacer(minLength: 20)
                    
                    Rectangle()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess, opacity: 1.0))
                    HStack {
                        Text("R: \(Int(rGuess * 255.0))")
                        Text("G: \(Int(gGuess * 255.0))")
                        Text("B: \(Int(bGuess * 255.0))")
                    }
                    
                }.padding()
                            
                Divider()
                
                VStack {
                    ColorSlider(value: $rGuess, textColor: .red)
                    ColorSlider(value: $gGuess, textColor: .green)
                    ColorSlider(value: $bGuess, textColor: .blue)
                }
                .cornerRadius(5)
                .background(Color.white)
                .padding(16)
                
                Button(action: {
                    self.showAlert = true
                }) {
                    Text("Calculate")
                        .font(.headline)
                        .bold()
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Your Score"), message: Text("\(computeScore())"))
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 45)
                .cornerRadius(10)
                .foregroundColor(.white)
                .background(Color.green)
                .padding([.leading, .bottom, .trailing], 16)
                
            }
            .background(Color(.systemBackground))
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
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}
