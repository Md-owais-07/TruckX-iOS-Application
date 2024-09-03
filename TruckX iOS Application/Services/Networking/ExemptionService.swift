//
//  ProductService.swift
//  TruckX iOS Application
//
//  Created by Owais on 14/08/24.
//

import Foundation

class ExemptionService {
    func getExemptionData(completion: @escaping (Result<ExemptionModel, Error>) -> Void)
    {
        guard let url = URL(string: "https://eld-backend.vercel.app/api/v1/user/getExemption") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
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
                let decoder = JSONDecoder()
                let response = try decoder.decode(ExemptionModel.self, from: data)
                print("RESPONSE")
                completion(.success(response))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }
        task.resume()
    }
}
