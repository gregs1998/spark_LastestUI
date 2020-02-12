//
//  ContentView.swift
//  spark_LastestUI
//
//  Created by Greg Schloemer on 2/11/20.
//  Copyright © 2020 Greg Schloemer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Tutorial.entity(), sortDescriptors: []) var tutorials: FetchedResults<Tutorial>
    
    @State private var showingAddScreen = false
    @State private var showingSheet = false
    
    func deleteTutorial(at offsets: IndexSet){
        for offset in offsets{
            let tutorial = tutorials[offset]
            moc.delete(tutorial)
        }
            try? moc.save()
        }
    
    var body: some View {
        //NavigationView{
                List{
                    ForEach(tutorials, id: \.self) { tutorial in
                        NavigationLink(destination: ChoiceView(tutorial: tutorial)){
                            VStack(alignment: .leading){
                                Text(tutorial.title ?? "Unknown")
                                    .fontWeight(.bold)
                                Text("Number of steps: \(tutorial.step!.count)")
                            }
                        }
                    }
                    .onDelete(perform: deleteTutorial)
                }
            .navigationBarTitle("Tutorials")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddScreen.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $showingAddScreen){
                    AddTutorialView().environment(\.managedObjectContext, self.moc)
            }
                
        //}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
