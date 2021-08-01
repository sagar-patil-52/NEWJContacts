//
//  APIHandler.swift
//  NEWJContacts
//
//  Created by mmt on 27/07/21.
//

import Foundation


enum API {
    case user
    
    func getFinalUrl() throws -> URL  {
        
        guard let baseURL = URL(string: Constants.URLList.baseURL) else {
            throw UserError.Failure(message: "Failed creating an URL")
        }
        var urlComponents : URLComponents?
        
        switch self {
        case .user:
            let searchURL = baseURL.appendingPathComponent(Constants.URLList.users)
            urlComponents = URLComponents(url: searchURL, resolvingAgainstBaseURL: true)
//            urlComponents?.queryItems = [
//                URLQueryItem(name: Constants.APIParams.searchKey, value: query),
//                URLQueryItem(name: Constants.APIParams.maxRows, value: "\(maxRows)"),
//                URLQueryItem(name: Constants.APIParams.usernameKey, value: "\(Constants.APIParams.username)")]
        }
        
        guard let finalURL = urlComponents?.url else {
            throw UserError.Failure(message: "Network Error")
        }
        return finalURL
    }
}

class APIHandler {
    
    var networkManager = NetworkHandler()
    var maxRows = 10
    
    func getUsers(completionHandler : @escaping CompletionHandler) {
        
        do {
            let url = try API.user.getFinalUrl()
            networkManager.getDataForAPI(url: url) { (data, error) -> (Void) in
                do {
                    let userlist = try JSONDecoder().decode([User].self, from: data as! Data)
                    completionHandler(userlist, nil)

                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Sagar : Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Sagar : Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Sagar : Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch  {
                    print("error : \(error)")
                    completionHandler(nil, UserError.Failure(message: error.localizedDescription))
                }
            }
        } catch  {
            completionHandler(nil, error as? UserError)
        }
    }
}
