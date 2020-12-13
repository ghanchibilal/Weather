//
//  APIHandler.swift
//  Weather
//
//  Created by Bilal Ghanchi on 09/12/20.
//

import Foundation

protocol WebClient {
    func load<T: Codable, U: Endpoint>(endpoint: U, complition: @escaping (Result<T, NetworkError<String>>)->())
    func loadInBackGround<T: Codable, U: Endpoint>(endpoint: U, complition: @escaping (Result<T, NetworkError<String>>)->())
}

struct APIClient {
    static let sharedObject = APIClient()
    /*
        This method is for actual Error handling come from api
     */
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> ResponseStatus<NetworkError<String>> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkError.authentication)
        case 501...599: return .failure(NetworkError.badReqeuest)
        case 600: return .failure(NetworkError.outdated)
        default: return .failure(NetworkError.invalidParams)
        }
    }
}

extension APIClient: WebClient  {
    
    /*
        This method is for actual API calling and resposible for json parsing and response
     */
    private func executeTask<T: Codable, U:Endpoint>(session:URLSession, endpoint:U, complition: @escaping (Result<T, NetworkError<String>>)->()) {
        do{
            let urlRequest:URLRequest? = try URLRequest(endpoint: endpoint)
            let task = session.dataTask(with: urlRequest!) { (data, response, error) in
                DispatchQueue.main.async {
                    guard error == nil else {
                        complition(.failure(.NoInternet))
                        return
                    }
                    switch self.handleNetworkResponse(response as! HTTPURLResponse) {
                    case .success:
                        do {
                            let result = try JSONDecoder().decode(T.self, from: data!)
                            complition(.success(result))
                        } catch {
                            print("error")
                        }
                    case .failure(let networkError):
                        complition(.failure(networkError))
                    }
                }
            }
            task.resume()
        } catch {
            complition(.failure(.invalidURL))
        }
    }
    
    /**
        Function is use to call Api
            - parameters
                endpoint create endpoint with url,model, request
            - parameters
                complition is use for callback with result params
     */
    
    func load<T: Codable, U: Endpoint>(endpoint: U, complition: @escaping (Result<T, NetworkError<String>>)->()) {
        let session = URLSession.shared
        executeTask(session: session, endpoint: endpoint, complition: complition)
    }
    
    /**
        Function is use to call Api in background
            - parameters
                endpoint create endpoint with url,model, request
            - parameters
                complition is use for callback with result params
     */
    
    func loadInBackGround<T: Codable, U: Endpoint>(endpoint: U, complition: @escaping (Result<T, NetworkError<String>>) -> ()) {
        let session = URLSession(configuration: URLSessionConfiguration.background(withIdentifier: "background"))
        executeTask(session: session, endpoint: endpoint, complition: complition)
    }
    
}
