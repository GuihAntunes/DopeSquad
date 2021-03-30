//
//  ImageDownloaderOperationQueue.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import Foundation

class ImageDownloadOperationQueue: OperationQueue {
    
    convenience init(maxConcurrentOperationCount: Int) {
        self.init()
        self.maxConcurrentOperationCount = maxConcurrentOperationCount
    }
    
    // MARK: Deinitalizers
    
    deinit {
        cancelAllOperations()
    }
    
}
