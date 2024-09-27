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
    
    func forgotPassword(email: String, completion: @escaping (Result<ForgotOtpDataModel, Error>) -> Void)
    {
        guard let url = URL(string: "https://eld-backend.vercel.app/api/v1/auth/forgetPassword") else {
            return print("INVALID FORGOT PASSWORD URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "email": email
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
            
            guard let data = data else {
                print("No data returned")
                return
            }
            
            do {
                let jsonResponse = try JSONDecoder().decode(ForgotOtpDataModel.self, from: data)
                print("RESPONSE OTP: \(jsonResponse)")
                completion(.success(jsonResponse))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func verifyOtp(otp: String, userId: String, completion: @escaping (Result<VerifyOtpResponseModel, Error>) -> Void)
    {
        guard let url = URL(string: "https://eld-backend.vercel.app/api/v1/auth/forgotVerifyotp/\(userId)") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = ["otp": otp]
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) else {
            print("Failed to encode the body")
            return
        }
        
        request.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let jsonResponse = try JSONDecoder().decode(VerifyOtpResponseModel.self, from: data)
                print("RESPONSE OTP: \(jsonResponse)")
                completion(.success(jsonResponse))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func createNewPassword(newPassword: String, confirmPassword: String, userId: String, completion: @escaping (Result<CreateNewPasswordModel, Error>) -> Void)
    {
        guard let url = URL(string: "https://eld-backend.vercel.app/api/v1/auth/changePassword/\(userId)") else {
            print("NEW PASSWORD URL NOT FOUND.")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "newPassword": newPassword,
            "confirmPassword": confirmPassword
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
            
            guard let data = data else {
                print("No data returned")
                return
            }
            
            do {
                let jsonResponse = try JSONDecoder().decode(CreateNewPasswordModel.self, from: data)
                print("RESPONSE NewPasswordModel: \(jsonResponse)")
                completion(.success(jsonResponse))
            } catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }

}
