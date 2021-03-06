//
//  DetailView.swift
//  BreadAndButter
//
//  Created by Artem Goldenberg on 24.01.2021.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(entity: User.entity(), sortDescriptors: []) private var users: FetchedResults<User>
    
    let user: User
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                HStack {
                    VStack {
                        ForEach(user.wrappedTags, id: \.self) { tag in
                            Text("#\(tag)").foregroundColor(.red).bold()
                        }.offset(x: -100, y: -10)
                    }
                }
                HStack {
                    if user.isActive {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 15, height: 15)
                    } else {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 15, height: 15)
                    }
                    Text(user.wrappedName).font(.title)
                }
                
                Text("\(user.age) years old").font(.title2)
                
                
                HStack {
                    Text("Work at")
                    Text(user.wrappedCompany).bold()
                }
                
                
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Email: ").bold()
                    Text(user.wrappedEmail).italic()
                        .padding(.bottom)
                
                
                    Text("Adress: ").bold()
                    Text(user.wrappedAdress).italic()
                    
                    Spacer()
                })
            
                Text("about: ").bold().font(.headline).padding(.top)
                Text(user.wrappedAbout).layoutPriority(1)
            
                Text("Friends").bold().padding(.top, 20)
                ForEach(user.friends, id: \.self) { friend in
                    NavigationLink(destination: DetailView(user: getUser(id: friend.wrappedId))) {
                        Text(friend.wrappedName)
                    }
                }
                Spacer()
                
            
            }
        }
    }
    func getUser(id: UUID) -> User {
        return users.first(where: { $0.id == id}) ?? User()
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let user = User(context: moc)
        user.name = "Artem Goldenberg"
        user.adress = "Puskhinskaya street"
        user.age = 19
        user.email = "artem.ibragimov1602@gmail.com"
        user.about = "love hawk:"
        user.company = "Goldenberg's corp"
        user.isActive = true
        user.tags = ["Super", "Mega cool", "Swimming", "Programming", "Chess"]
        
        return NavigationView {
            DetailView(user: user)
        }
    }
}
