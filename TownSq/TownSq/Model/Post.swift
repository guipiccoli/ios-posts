//   let post = try? newJSONDecoder().decode(Post.self, from: jsonData)

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
//    enum CodingKeys: String, CodingKey {
//        case userId
//        case id, title, body
//    }
}

