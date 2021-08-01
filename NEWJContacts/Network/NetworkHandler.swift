//
//  NetworkHandler.swift
//  NEWJContacts
//
//  Created by mmt on 27/07/21.
//

import Foundation

typealias CompletionHandler = ( Any?, UserError?) -> (Void)

enum UserError : Error {
    case Success
    case Failure(message : String)
    
    func getErrorMessage() -> String {
        switch self {
        case .Failure(let message):
            return message
        case .Success:
            return ""
        }
    }
}

class NetworkHandler {
    
    func getDataForAPI(url : URL, completionHandler : @escaping CompletionHandler)  {
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    completionHandler(nil, UserError.Failure(message: error.localizedDescription))
                }
                if let data = data {
                    completionHandler(data, nil)
                }
            }
        }.resume()
    }
}
