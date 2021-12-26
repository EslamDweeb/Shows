//
//  NetworkConfig.swift
//  Shows
//
//  Created by eslam dweeb on 25/12/2021.
//

import Foundation
/// HTTP request methods.
enum RequestMethod: String {
    /// HTTP GET
    case get = "GET"
    /// HTTP POST
    case post = "POST"
    /// HTTP PUT
    case put = "PUT"
    /// HTTP PATCH
    case patch = "PATCH"
    /// HTTP DELETE
    case delete = "DELETE"
}
/// Type alias used for HTTP request headers.
typealias ReaquestHeaders = [String: String]
/// Type alias used for HTTP request parameters. Used for query parameters for GET requests and in the HTTP body for POST, PUT and PATCH requests.
typealias RequestParameters = [String : Any?]

protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var parameters: RequestParameters? { get }
    var method: RequestMethod { get }
}
extension Service {
    public var urlRequest: URLRequest {
        guard let url = self.url else {
            fatalError("URL could not be built")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        return request
    }

    private var url: URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path

        if method == .get {
            // add query items to url
            guard let parameters = parameters as? [String: String] else {
                fatalError("parameters for GET http method must conform to [String: String]")
            }
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }

        return urlComponents?.url
    }
}
