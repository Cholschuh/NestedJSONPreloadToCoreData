//
//  roomDetailsView.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/16/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//

import Foundation
import UIKit
class roomDetailView: UIView, UIScrollViewDelegate{
    
    @IBOutlet weak var roomNameLbl: UILabel!
    @IBOutlet weak var roomInfoLbl: UILabel!
    @IBOutlet weak var roomImag: UIImage!
    @IBOutlet weak var imgScrollView: UIScrollView!
    @IBOutlet weak var imgPageControl: UIPageControl!
    
    
    
    func configureView(roomObj: RoomsMO){
        roomNameLbl.text = roomObj.name
        roomInfoLbl.text = roomObj.information
        let roomPhotos = roomObj.photos!
        imgPageControl.numberOfPages = roomPhotos.count
        for photo in roomPhotos{
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            imageView.image = UIImage(named: photo.path ?? "")
            imageView.accessibilityLabel = photo.altText
            imgScrollView.addSubview(imageView)
        }
        
        
    }

    
}
