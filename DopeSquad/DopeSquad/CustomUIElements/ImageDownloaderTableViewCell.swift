//
//  ImageDownloaderTableViewCell.swift
//  DopeSquad
//
//  Created by Guilherme Antunes on 30/03/2021.
//

import UIKit

class ImageDownloaderTableViewCell: UITableViewCell {

    var imageDownloader: ImageDownloadOperationQueue = .init(maxConcurrentOperationCount: 5)

}
