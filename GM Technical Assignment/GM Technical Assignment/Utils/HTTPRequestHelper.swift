//
//  HTTPRequestHelper.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import Foundation

/**
 Create an object of the class HTTPRequestHelper with a response data type (model)
 */
class HTTPRequestHelper {
    /**
     * Create and send a HTTP request using URLSession and automaticaly serialize the response data to a type (model) passed as parameter.
     *
     * - Parameter url: The url to perform the request.
     * - Parameter parameters: The request parameters to be sent with the request.
     * - Parameter completion: The clousure that will be called with the Result object.
     */
    func sendRequest<T: Codable>(_ url: String, parameters: [String: String]? = nil, completion: @escaping (Result<[T], Error>) -> Void) {
        var components = URLComponents(string: url)!
        if let parameters = parameters {
            components.queryItems = parameters.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Check for the data, response and error and return an error if not as expected
            guard let data = data else {
                completion(.failure(NSError(domain: "No data returned.", code: 1, userInfo: nil)))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "Could not get a response.", code: 2, userInfo: nil)))
                return
            }
            guard (200 ..< 300) ~= response.statusCode else {
                completion(.failure(NSError(domain: "It was not possible to load data. Error \(response.statusCode) returned.", code: 3, userInfo: nil)))
                return
            }
            guard error == nil else {
                completion(.failure(error!))
                return
            }
           
            // Serialize the data into an array of objects
            do {
                let objects = try JSONDecoder().decode([T].self, from: data)
                completion(.success(objects))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
