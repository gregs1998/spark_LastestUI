//
//  Step+CoreDataProperties.swift
//  spark_LastestUI
//
//  Created by Greg Schloemer on 2/11/20.
//  Copyright © 2020 Greg Schloemer. All rights reserved.
//
//

import Foundation
import CoreData


extension Step {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Step> {
        return NSFetchRequest<Step>(entityName: "Step")
    }

    @NSManaged public var descrip: String?
    @NSManaged public var pos1Row: String?
    @NSManaged public var pos2Row: String?
    @NSManaged public var pos1Column: String?
    @NSManaged public var pos2Column: String?
    @NSManaged public var componentType: String?
    @NSManaged public var id: UUID?
    @NSManaged public var tutorial: Tutorial?

}
