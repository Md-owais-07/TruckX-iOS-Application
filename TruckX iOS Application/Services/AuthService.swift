//
//  AuthService.swift
//  TruckX iOS Application
//
//  Created by Owais on 14/08/24.
//

import Foundation

class AuthService {
    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        
//        let api = Api.shared.signIn
        
        
        guard let url = URL(string: "https://eld-backend.vercel.app/api/v1/auth/signin") else {
            print("Invalid URL")
            return
        }
        
        
//        var completeURL = AppInfo.shared.baseURL + api.url
//        completeURL = completeURL.replacingOccurrences(of: " ", with: "%20")
//        print("COMPLETEURL: ", completeURL)
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch let error {
            print("Error creating JSON body: \(error)")
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            switch httpResponse.statusCode {
            case 200, 201:
                // Successful login
                guard let data = data else {
                    print("No data returned")
                    return
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let accessToken = json["accessToken"] as? String {
                        completion(.success(accessToken))
                    } else {
                        print("Invalid response")
                    }
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            case 401:
                print("Debug: Wrong password or unauthorized access")
                completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Unauthorized"])))
            default:
                print("Debug: Unexpected status code \(httpResponse.statusCode)")
                completion(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "Unexpected status code \(httpResponse.statusCode)"])))
            }
        }
        
        task.resume()
    }
}
