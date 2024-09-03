//
//  UserService.swift
//  TruckX iOS Application
//
//  Created by Owais on 14/08/24.
//

import Foundation

class UserService {
    func getUserProfile(completion: @escaping (Result<UserProfileModel, Error>) -> Void)
    {
        guard let url = URL(string: "https://eld-backend.vercel.app/api/v1/user/getProfile") else {
            print("INVALID PROFILE URL.")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Bearer \(UserData.shared.currentAuthKey)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                print("NO DATA FOUND.")
                return
            }
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON Response: \(jsonString)")
            }
            do {
                let decodedResponse = try JSONDecoder().decode(UserProfileModel.self, from: data)
                print("USER-PROFILE RESPONSE")
                completion(.success(decodedResponse))
            } catch(let err) {
                completion(.failure(err))
            }
        }
        task.resume()
    }
}
