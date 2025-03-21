//
//  ContentView.swift
//  NewsApp
//
//  Created by София Кармаева on 21/3/2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var businessNetworkManager = BusinessNetworkManager()
    @ObservedObject var entertainmentNetworkManager = EntertainmentNetworkManager()
    @ObservedObject var generalNetworkManager = GeneralNetworkManager()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Business").font(.title).bold()
                
                List (businessNetworkManager.newsBusinessArticles) { newsBusinessArticle in
                    NavigationLink(destination: DetailsView(url: newsBusinessArticle.url)) {
                        AsyncImage(url: URL(string: newsBusinessArticle.urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"), scale: 10)
                        Text(newsBusinessArticle.title)
                    }
                }.onAppear {
                    self.businessNetworkManager.fetchBusinessData()
                }
                
//                ScrollView(.horizontal) {
//                        HStack {
//                            ForEach(businessNetworkManager.newsBusinessArticles){ newsBusinessArticle in
//                                ZStack {
//                                    AsyncImage(url: URL(string: newsBusinessArticle.urlToImage!)).frame(width: 50, height: 50)
//                                    Text(newsBusinessArticle.title).font(.title2)
//                                }
//                            }.onAppear {
//                                self.entertainmentNetworkManager.fetchEntertainmentData()
//                            }
//                        }
//                    }
                
                
                
                Text("Entertainment").font(.title).bold()
                List (entertainmentNetworkManager.newsEntertainmentArticles) { newsEntertainmentArticle in
                    NavigationLink(destination: DetailsView(url: newsEntertainmentArticle.url)) {
                        HStack {
                            AsyncImage(url: URL(string: newsEntertainmentArticle.urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"), scale: 10)
                            Text(newsEntertainmentArticle.title).font(.title2)
                        }.frame(width: 300, height: 300)
                    }
                }.onAppear {
                    self.entertainmentNetworkManager.fetchEntertainmentData()
                }
                
                
                
                Text("General").font(.title).bold()
                List (generalNetworkManager.newsGeneralArticles) { newsGeneralArticle in
                    NavigationLink(destination: DetailsView(url: newsGeneralArticle.url)) {
                        AsyncImage(url: URL(string: newsGeneralArticle.urlToImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"), scale: 10)
                        Text(newsGeneralArticle.title)
                    }
                }.onAppear {
                    self.generalNetworkManager.fetchGeneralData()
                }
            }
            .navigationTitle("News")
        }
    }
}

#Preview {
    ContentView()
}
