//
//  Results.swift
//  NewsApp
//
//  Created by София Кармаева on 21/3/2025.
//

import Foundation

struct Results: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Identifiable, Hashable {
    var id: String {
        return url ?? "abc"
    }
    let title: String
    let description: String?
    let urlToImage: String?
    let url: String?
}
