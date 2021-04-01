//
//  ImageDownloaderCollectionViewCell.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 01/04/2021.
//

import UIKit

class ImageDownloaderCollectionViewCell: UICollectionViewCell {

    var imageDownloader: ImageDownloadOperationQueue = .init(maxConcurrentOperationCount: 5)

}
