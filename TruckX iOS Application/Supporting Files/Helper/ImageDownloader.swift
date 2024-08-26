//
//  ImageDownloader.swift
//  TruckX iOS Application
//
//  Created by Owais on 13/08/24.
//

import UIKit

class ImageDownloader {
//    static func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data, let image = UIImage(data: data) {
//                completion(image)
//            } else {
//                completion(nil)
//            }
//        }.resume()
//    }
//
//    static func setImage(from urlString: String?, to imageView: UIImageView) {
//        guard let imgUrlString = urlString, let imgUrl = URL(string: imgUrlString) else {
//            return
//        }
//        
//        // Start an asynchronous task to download the image
//        downloadImage(from: imgUrl) { (image) in
//            DispatchQueue.main.async {
//                imageView.image = image
//            }
//        }
//    }
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}

