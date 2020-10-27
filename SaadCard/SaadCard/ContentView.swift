//
//  ContentView.swift
//  SaadCard
//
//  Created by Saad Shamim on 19/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        ZStack{
            
            Color(red: 0.61, green: 0.35, blue: 0.71)
                .edgesIgnoringSafeArea(.all)
            
            Text("Saad Shamim")
                .padding()
                .font(.title)
                .w
                .for
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
    }
}
