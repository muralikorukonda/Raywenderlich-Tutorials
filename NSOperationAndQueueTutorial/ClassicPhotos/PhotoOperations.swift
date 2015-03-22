//
//  PhotoOperations.swift
//  ClassicPhotos
//
//  Created by Murali Korukonda on 23/10/14.
//  Copyright (c) 2014 raywenderlich. All rights reserved.
//

import Foundation
import UIKit

enum PhotoRecordState{
    case New,Downloaded,Filtered, Failed
}

class PhotoRecord{
    let name:String
    let URL:NSURL
    var state = PhotoRecordState.New
    var image = UIImage(named: "Placeholder")
    
    init(name:String,url:NSURL){
        self.name = name
        self.URL = url
    }
}

class PendingOperations {
    lazy var downloadsInProgress = Dictionary<NSIndexPath,NSOperation>();
    lazy var downloadQueue:NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "Download Queue"
        queue.maxConcurrentOperationCount = 1
       return queue
    }()
    
    lazy var filterationsInProgress = Dictionary<NSIndexPath,NSOperation>();
    lazy var filterQueue:NSOperationQueue = {
        var queue = NSOperationQueue()
        queue.name = "Image Filteration Queue"
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
}

class ImageDownloader:NSOperation{
    let photoRecord: PhotoRecord
    
    init(photoRecord:PhotoRecord){
        self.photoRecord = photoRecord
    }
    
    override func main() {
        autoreleasepool{
            if self.cancelled{
                return
            }
            
            let imageData = NSData(contentsOfURL: self.photoRecord.URL)
            
            if self.cancelled{
                return
            }
            
            if imageData.length>0{
                self.photoRecord.image = UIImage(data: imageData)
                self.photoRecord.state = .Downloaded
            }
            else{
                self.photoRecord.state = .Failed
                self.photoRecord.image = UIImage(named: "Failed")
            }
        }
    }
}

class ImageFilteration:NSOperation{
    let photoRecord:PhotoRecord
    
    init(photoRecord:PhotoRecord) {
        self.photoRecord = photoRecord
    }
    
    override func main() {
        autoreleasepool{
            if self.cancelled{
                return
            }
            if self.photoRecord.state != .Downloaded{
                return
            }
            if let filteredImage = self.applySepiaFilter(self.photoRecord.image){
                self.photoRecord.image = filteredImage
                self.photoRecord.state = .Filtered
            }
        }
    }
    func applySepiaFilter(image:UIImage) -> UIImage? {
        let inputImage = CIImage(data:UIImagePNGRepresentation(image))
        
        if self.cancelled {
            return nil
        }
        let context = CIContext(options:nil)
        let filter = CIFilter(name:"CISepiaTone")
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(0.8, forKey: "inputIntensity")
        let outputImage = filter.outputImage
        
        if self.cancelled {
            return nil
        }
        
        let outImage = context.createCGImage(outputImage, fromRect: outputImage.extent())
        let returnImage = UIImage(CGImage: outImage)
        return returnImage
    }
}
