//
//  HomeView.swift
//  spark_LastestUI
//
//  Created by Greg Schloemer on 2/11/20.
//  Copyright © 2020 Greg Schloemer. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                Image("sparkLogo")
                NavigationLink(destination: ContentView()) {
                    Text("Tutorials")
                        .font(.largeTitle)
                }
                Button("Speech", action:{
                    
                })
                Spacer()
            }
        }.onAppear(perform: startSpeech)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

func startSpeech(){
    let speaker = speechModel()
    speaker.speak(textToSay: "Welcome to SPARK, your personal circuit building application.")
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
