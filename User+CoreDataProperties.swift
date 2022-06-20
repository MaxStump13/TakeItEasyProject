//
//  User+CoreDataProperties.swift
//  TakeItEasyProject
//
//  Created by Zachary Saffron on 6/16/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var mobileNumber: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var repassword: String?
    @NSManaged public var username: String?

}

extension User : Identifiable {

}
