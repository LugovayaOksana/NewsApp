//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Оксана on 09.11.2021.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(author: "Tim Stelloh",
              url: "https://www.nbcnews.com/news/us-news/longtime-anchor-brian-williams-leaving-nbc-28-years-rcna5042",
              source: "NBC News",
              title: "Longtime anchor Brian Williams leaving NBC after 28 years - NBC News",
              articleDescription: "MSNBC host and former NBC Nightly News” anchor and managing editor Brian Williams is leaving NBC at the end of the year to spend time with his family, MSNBC",
              image:"https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/rockcms/2021-11/211109-brian-williams-jm-2028-c135e8.jpg",
              date: Date()
        )
    }
}
