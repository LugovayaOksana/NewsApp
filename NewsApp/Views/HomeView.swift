//
//  HomeView.swift
//  NewsApp
//
//  Created by Оксана on 09.11.2021.
//

import SwiftUI

let coloredNavAppearance = UINavigationBarAppearance()

struct HomeView: View {
    
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
//    init() {
//        UIView.appearance().backgroundColor = .white //backgroundColor of all
//         UITableView.appearance().backgroundColor = .red // screen color below the list
//        }
    
    
    var body: some View {
        Group{
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error,
                          handler: viewModel.getArticles)
            case .success(let articles):
                ZStack {
                    NavigationView {
                        List(articles) {item in
                            ArticleView(article: item)
                                .onTapGesture {
                                    load(url: item.url)
                                }
                        }
                        .navigationTitle(Text("News"))
                    }
                }
            }
            
        }.onAppear(perform: viewModel.getArticles)
    }
    
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else {return}
        openUrl(url)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
