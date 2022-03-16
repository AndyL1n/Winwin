//
//  ArticleItem.swift
//  main
//
//  Created by Andy on 2022/3/16.
//

import Foundation

public struct ArticleItem: Codable {
    let title, content: String
    let imageUrls: [String]
    let user: User
    let favoriteCount: Int
    let likeCount: Int
    let commentCount: Int
    let unlockCount: Int
    let type: Int
    let tags: [String]
    let creationDate: String
}

public struct User: Codable {
    let id: Int
    let nickName: String
    let imageUrl: String
}
