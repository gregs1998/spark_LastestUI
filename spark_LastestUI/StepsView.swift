//
//  StepsView.swift
//  spark_LastestUI
//
//  Created by Greg Schloemer on 2/11/20.
//  Copyright © 2020 Greg Schloemer. All rights reserved.
//

import SwiftUI
import CoreData

struct StepsView: View {
   // let currentTutorial: Tutorial
            
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    let currentTutorial: Tutorial

//    @FetchRequest(
//        entity: Step.entity(),
//        sortDescriptors: [NSSortDescriptor(key: "stepNum", ascending: true)],
//        predicate: NSPredicate(format: "tutorial == %@", currentTutorial)
//    ) var steps: FetchedResults<Step>
        
    @State private var showingAddScreen = false
    
//    func getDescription(step: Step)->String{
//        guard let stepDescrip = step.descrip as String? else { return "" }
//        return stepDescrip
//    }
//
//    func getComponentType(step: Step)->String{
//        guard let stepComponentType = step.componentType as String? else { return "" }
//        return stepComponentType
//    }
//
//    func getPos1Info(step: Step)-> [String]{
//        guard let pos1Column = step.pos1Column as String? else { return [] }
//        guard let pos1Row = step.pos1Row as String? else { return [] }
//        let pos1Info = [pos1Column, pos1Row]
//        return pos1Info
//    }
//
//    func getPos2Info(step: Step)-> [String]{
//        guard let pos2Column = step.pos2Column as String? else { return [] }
//        guard let pos2Row = step.pos2Row as String? else { return [] }
//        let pos2Info = [pos2Column, pos2Row]
//        return pos2Info
//    }
    
    func deleteStep(at offsets: IndexSet){
        for offset in offsets{
            let step = currentTutorial.step![offset] as! NSManagedObject
            moc.delete(step)
        }
            try? moc.save()
        self.presentationMode.wrappedValue.dismiss()

        }
    
//    func fetch(){
//        let stepGetter = getSteps()
//        steps = try! stepGetter.fetch(tutorial: currentTutorial, moc: moc)
//    }
    
        var body: some View {
           // NavigationView{
                VStack{
                    StepsList(tutorial: currentTutorial)
//                    List{
//                        ForEach(Array(currentTutorial.step!.set), id:\.self){ step in
//                        //ForEach(steps, id:\.self){ step in
//                            VStack(alignment: .leading){
//                                Text("\(self.getDescription(step: step as! Step))")
//                                    .fontWeight(.bold)
//                                Text("\(self.getComponentType(step: step as! Step))")
//                                Text("Position 1: \(self.getPos1Info(step:step as! Step)[0]) \(self.getPos1Info(step:step as! Step)[1])")
//                                if(self.getComponentType(step: step as! Step) == "Resistor"){
//                                Text("Position 2: \(self.getPos2Info(step:step as! Step)[0]) \(self.getPos2Info(step:step as! Step)[1])")
//                                }
//                            }
//                        }
//                        .onDelete(perform: deleteStep)
//                    }
                }
                .navigationBarTitle("Steps")
                .navigationBarItems(trailing:
                    Button(action: {
                        self.showingAddScreen.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                )
                    .sheet(isPresented: $showingAddScreen){
                        AddStepsView(tutorialToAddStep: self.currentTutorial).environment(\.managedObjectContext, self.moc)
                }
           // }
        //.navigationViewStyle(StackNavigationViewStyle())
        }
    }

struct StepsView_Previews: PreviewProvider {
    static var previews: some View {
        let tutorial = Tutorial()
        tutorial.title = "Example"
        
        return NavigationView{
            StepsView(currentTutorial: tutorial)
        }
    }
}
