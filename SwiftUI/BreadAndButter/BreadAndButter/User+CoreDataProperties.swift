//
//  User+CoreDataProperties.swift
//  BreadAndButter
//
//  Created by Artem Goldenberg on 24.01.2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    @NSManaged public var about: String?
    @NSManaged public var adress: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registred: Date?
    @NSManaged public var tags: [String]?
    @NSManaged public var friend: NSSet?
    
    var wrappedName: String {
        name ?? "Unknown name"
    }
    var wrappedCompany: String {
        company ?? "No company"
    }
    var wrappedEmail: String {
        email ?? "No email adress"
    }
    var wrappedAdress: String {
        adress ?? "Adress unknown"
    }
    var wrappedAbout: String {
        about ?? "No additional information"
    }
    var wrappedRegistred: String {
        let formatter = DateFormatter()
        
        formatter.dateStyle = .short
        
        if let unwrap = registred {
            return formatter.string(from: unwrap)
            
        } else {
            return "Unknown registrate date"
            
        }
    }
    var wrappedTags: [String] {
        tags ?? [String]()
    }
    var friends: [Friend] {
        let set = friend as? Set<Friend> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for friend
extension User {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: Friend)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: Friend)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

extension User : Identifiable {

}

