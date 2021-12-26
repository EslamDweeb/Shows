//
//  ServiceProvider.swift
//  Shows
//
//  Created by eslam dweeb on 26/12/2021.
//

import Foundation
class ServiceProvider<T: Service> {
    var urlSession = URLSession.shared

    init() { }

    func load(service: T, completion: @escaping (Result<Data,Error>) -> Void) {
        call(service.urlRequest, completion: completion)
    }

    func load<U>(service: T, decodeType: U.Type, completion: @escaping (Result<U,Error>) -> Void) where U: Decodable {
        call(service.urlRequest) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let resp = try decoder.decode(decodeType, from: data)
                    completion(.success(resp))
                }
                catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension ServiceProvider {
    private func call(_ request: URLRequest, deliverQueue: DispatchQueue = DispatchQueue.main, completion: @escaping (Result<Data,Error>) -> Void) {
        urlSession.dataTask(with: request) { (data, _, error) in
            if let error = error {
                deliverQueue.async {
                    completion(.failure(error))
                }
            } else if let data = data {
                deliverQueue.async {
                    completion(.success(data))
                }
            }
              }.resume()
    }
}
