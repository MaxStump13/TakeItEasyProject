//
//  Journal+CoreDataProperties.swift
//  TakeItEasy2
//
//  Created by admin on 6/10/22.
//
//

import Foundation
import CoreData


extension Journal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Journal> {
        return NSFetchRequest<Journal>(entityName: "Journal")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?

}

extension Journal : Identifiable {

}
