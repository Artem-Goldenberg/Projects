//
//  ContentView.swift
//  BreadAndButter
//
//  Created by Artem Goldenberg on 23.01.2021.
//

import SwiftUI
import CoreData

struct SampleUser: Decodable {
    
    struct SampleFriend: Decodable {
        public var id: UUID
        public var name: String
    }
    
    public var id: UUID
    public var about: String
    public var address: String
    public var age: Int16
    public var company: String
    public var email: String
    public var isActive: Bool
    public var name: String
    public var registered: String
    public var tags: [String]
    public var friends: [SampleFriend]
    
}


struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @State private var firstLaunch = true
    
    @FetchRequest(entity: User.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \User.name, ascending: true)
    ]) private var users: FetchedResults<User>
    
    @State private var sheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: DetailView(user: user)) {
                        HStack(alignment: .bottom) {
                            Text("\(user.wrappedName),").font(.headline)
                            Text("\(user.age) years")
                        }
                    }
                }
                .onDelete(perform: deleteUser)
            }
            .onAppear(perform: loadData)
            .navigationBarTitle("All Users")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                sheet = true
            }) {
                Image(systemName: "plus")
            })
//                .sheet(isPresented: false) {
//                    AddUserView()
//                }
       
        }
    }
    
    func deleteUser(at offsets: IndexSet) {
        for offset in offsets {
            moc.delete(users[offset])
        }
        
        try? moc.save()
    }
    
     func loadData() {
        if firstLaunch {
            self.firstLaunch = false
        } else {
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Ivalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([SampleUser].self, from: data) {
                    DispatchQueue.main.async {
                        do {
                            try saveData(inputData: decoded)
                            
                        } catch {
                            print("Cannot save the data")
                        }
                    }
                    return
                }
            }
            
            print("failed: \(error?.localizedDescription ?? "Unknown eroor")")
            
        }.resume()
    }
    
    func saveData(inputData: [SampleUser]) throws {
        for user in inputData {
            let newUser = User(context: moc)
            newUser.name = user.name
            newUser.about = user.about
            newUser.age = user.age
            newUser.adress = user.address
            newUser.company = user.company
            newUser.email = user.email
            newUser.id = user.id
            newUser.isActive = user.isActive
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            newUser.registred = formatter.date(from: user.registered)!
            
            newUser.tags = user.tags
            for friend in user.friends {
                let newFriend = Friend(context: moc)
                newFriend.id = friend.id
                newFriend.name = friend.name
                newFriend.addToUser(newUser)
            }
        }
        try self.moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
