//
//  AuthService.swift
//  TruckX iOS Application
//
//  Created by Owais on 14/08/24.
//

import Foundation

class AuthService {
    func signIn(email: String, password: String, completion: @escaping (Result<SignInResponse, Error>) -> Void)
    {
        guard let url = URL(string: "https://eld-backend.vercel.app/api/v1/auth/signin") else {
            print("Invalid SignIn URL")
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
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "No response data"])))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                let errorMessage = "Server error with status code: \(response.statusCode)"
                completion(.failure(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])))
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON Response SignIN: \(jsonString)")
            }
            
            do {
                let signInResponse = try JSONDecoder().decode(SignInResponse.self, from: data)
                completion(.success(signInResponse))
            } catch {
                print("Decoding Error: \(error)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func createUser(fName: String, lName: String, email: String, password: String, completion: @escaping (Result<CreateUserResponse, Error>) -> Void)
    {
        guard let url = URL(string: "https://eld-backend.vercel.app/api/v1/admin/createUser") else {
            completion(.failure(NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid CreateUser URL"])))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "firstName": fName,
            "lastName": lName,
            "email": email,
            "password": password
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "No response data"])))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                let errorMessage = "Server error with status code: \(response.statusCode)"
                completion(.failure(NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: errorMessage])))
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON Response: \(jsonString)")
            }
            
            do {
                let createUserResponse = try JSONDecoder().decode(CreateUserResponse.self, from: data)
                completion(.success(createUserResponse))
            } catch {
                print("Decoding Error: \(error)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
