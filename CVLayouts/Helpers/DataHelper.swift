//
//  DataHelper.swift
//  CVLayouts
//
//  Created by Telem Tobi on 16/03/2020.
//  Copyright © 2020 Telem Tobi. All rights reserved.
//

import Foundation

class DataHelper {
    
    let shared = DataHelper()
    
    private init(){}
    
    
    
    private func getRequest(from urlString: String, _ completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            if let response = response as? HTTPURLResponse {
                print(urlString)
                print("statusCode: \(response.statusCode)")
            }
            if let data = data {
                completion(data, nil)
            }
        }
        task.resume()
    }
}
