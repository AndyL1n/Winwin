//
//  DataViewModel.swift
//  main
//
//  Created by Andy on 2022/3/16.
//

import Foundation
import Alamofire

public class DataViewModel {
    public var articleList: [ArticleItem] = []
    
    public var onFinishFetch: (() -> Void)?
    
    public func fetchArticle() {
        request { [unowned self] result in
            switch result {
            case .success(let article):
                self.articleList = article
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
            self.onFinishFetch?()
        }
    }
    
    
    private func request(complete: @escaping ((Result<([ArticleItem]), Error>) -> Void)) {
        AF.request("https://raw.githubusercontent.com/winwiniosapp/Android-APP-Practice/main/android.json").responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let items = try JSONDecoder().decode([ArticleItem].self, from: data)
                    complete(.success(items))
                } catch let error {
                    complete(.failure(error))
                }
            case .failure(let error):
                complete(.failure(error))
            }
        }
        
        
    }
}
