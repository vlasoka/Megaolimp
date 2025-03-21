//
//  EntertainmentNetworkManager.swift
//  NewsApp
//
//  Created by София Кармаева on 21/3/2025.
//

import Foundation

class EntertainmentNetworkManager: ObservableObject {
    
    @Published var newsEntertainmentArticles = [Article]()

    func fetchEntertainmentData() {
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?category=entertainment&apiKey=bfa0a456eefd47fbbe206fd0d1bf0a71") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.newsEntertainmentArticles = results.articles
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
