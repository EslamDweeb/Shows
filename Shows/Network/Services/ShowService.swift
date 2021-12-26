//
//  ShowService.swift
//  Shows
//
//  Created by eslam dweeb on 26/12/2021.
//

import Foundation

enum ShowService {
    case getShows
}

extension ShowService: Service {
    var baseURL: String {
        return "http://api.tvmaze.com"
    }

    var path: String {
        switch self {
        case .getShows:
            return "/search/shows?q=Future"
        
        }
    }

    var parameters: RequestParameters? {
        
        switch self {
        case .getShows:
            return nil
        }
    }

    var method: RequestMethod {
        return .get
    }
}
