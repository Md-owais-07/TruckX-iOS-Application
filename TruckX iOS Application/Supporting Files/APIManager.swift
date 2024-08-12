//
//  APIManager.swift
//  TruckX iOS Application
//
//  Created by Owais on 12/08/24.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        guard let url = URL(string: "https://eld-backend.vercel.app/api/v1/auth/signin") else {
            print("Invalid URL")
            return
        }
        
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
        }
        
        task.resume()
    }
}
