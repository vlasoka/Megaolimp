//
//  DetailsView.swift
//  NewsApp
//
//  Created by София Кармаева on 21/3/2025.
//

import SwiftUI

struct DetailsView: View {
    
    var url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailsView(url: "https://www.google.com")
}
