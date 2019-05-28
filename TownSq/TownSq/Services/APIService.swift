
//  Created by Guilherme Piccoli on 27/05/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation

struct APIService {
    
    static func getPosts(completionHandler completion: @escaping ([Post]) -> Void) {
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            guard error == nil else {
                print(error!.localizedDescription)
                completion([])
                return
            }
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data!)
                completion(posts)
            } catch {
                print(error.localizedDescription)
                completion([])
            }
        })
        dataTask.resume()
    }
    
    static func getUsers(completionHandler completion: @escaping ([User]) -> Void) {
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            guard error == nil else {
                print(error!.localizedDescription)
                completion([])
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data!)
                completion(users)
            } catch {
                print(error.localizedDescription)
                completion([])
            }
        })
        dataTask.resume()
    }
}
