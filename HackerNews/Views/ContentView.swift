//
//  ContentView.swift
//  HackerNews
//
//  Created by Elliot Hannah III on 3/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text("\(post.points)")
                            Text(post.title)
                        }
                    })
                
            }
            .navigationBarTitle("HACKER NEWS")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Greetings"),
//    Post(id: "3", title: "What's up")
//]
