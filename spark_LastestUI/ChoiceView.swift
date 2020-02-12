//
//  ChoiceView.swift
//  spark_LastestUI
//
//  Created by Greg Schloemer on 2/11/20.
//  Copyright © 2020 Greg Schloemer. All rights reserved.
//

import SwiftUI

struct ChoiceView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let tutorial: Tutorial
    var body: some View {
        Form{
            NavigationLink(destination: StepsView(currentTutorial: tutorial)){
                Text("Edit Tutorial")
            }
            NavigationLink(destination: Text("Hi")){
                Text("Open in AR")
                    .foregroundColor(Color.blue)
                
            }
        }
    }
}

struct ChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        let tutorial = Tutorial()
        tutorial.title = "Example"
        
        return NavigationView{
            StepsView(currentTutorial: tutorial)
        }
    }
}
