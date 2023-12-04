//
//  ImageService.swift
//  iosSchool_HH
//
//  Created by student on 30.11.2023.
//

import UIKit

protocol ImageService {
    func getImage(url: String, completion: @escaping (UIImage?) -> Void)
}

class ImageServiceImp: ImageService {

    private let maxSize = 50

    private var imageDict: [String: UIImage] = [:]

    private let apiClient: ApiClient
    private let updateQueue = DispatchQueue(label: "ImageServiceQueue")

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
        if let item = imageDict[url] {
            completion(item)
            return
        }
        if imageDict.count > maxSize {
            imageDict.removeAll()
        }
        DispatchQueue.global().async {
            self.apiClient.requestImageData(url: url) { [weak self] data in
                guard let data else {
                    return
                }
                self?.updateQueue.async {
                    let image = UIImage(data: data)
                    self?.imageDict[url] = image
                    completion(image)
                }
            }
        }
    }
}
