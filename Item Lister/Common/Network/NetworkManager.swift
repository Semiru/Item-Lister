//
//  NetworkManager.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import Alamofire

final class NetworkManager: NSObject {

    enum Constants {

        static let baseURL = URL(string: "http://5e209e06e31c6e0014c60962.mockapi.io/api/")
        static let itemListURLPath = "products"
    }

    static let shared = NetworkManager()

    private override init() { }
}

// MARK: - Request Methods

extension NetworkManager {

    /// Fetches item list and handles response
    /// - Parameter completion: Completion block to call when response is received
    func fetchItemList(completion: @escaping (([Item]?) -> Void)) {
        guard let baseURL = Constants.baseURL else {
            return
        }

        let url = "\(baseURL)\(Constants.itemListURLPath)"
        let request = AF.request(url, method: .get, parameters: nil)

        request.validate().responseJSON { response in
            switch response.result {
            case .success:
                guard let responseData = response.data else {
                    completion(nil)
                    return
                }

                let decoder = JSONDecoder()

                if let response = try? decoder.decode([Item].self, from: responseData) {
                    completion(response)
                } else {
                    completion(nil)
                }
            case .failure:
                completion(nil)
            }
        }
    }
}
