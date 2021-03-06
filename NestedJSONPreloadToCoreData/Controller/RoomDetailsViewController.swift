//
//  RoomDetailsViewController.swift
//  NestedJSONPreloadToCoreData
//
//  Created by Chris Holschuh on 2/16/20.
//  Copyright © 2020 Chris Holschuh. All rights reserved.
//

import UIKit

class RoomDetailsViewController: UIViewController, UIScrollViewDelegate {
    
  
    @IBOutlet weak var roomNameLbl: UILabel!
    @IBOutlet weak var roomInfoTextView: UITextView!
    @IBOutlet weak var imgScrollView: UIScrollView!
    @IBOutlet weak var imgPageControl: UIPageControl!
    var roomObj: RoomsMO?
    //var photoObjs: [PhotosMO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let roomObj = roomObj{
                  configureView(roomObj: roomObj)
              }else{
                  print("Not able to load room object")
              }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        if let roomObj = roomObj{
//            configureView(roomObj: roomObj)
//        }else{
//            print("Not able to load room object")
//        }
    }
    
    @IBAction func dismissBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
      }
    
    func configureView(roomObj: RoomsMO){
        roomNameLbl.text = roomObj.name
        roomInfoTextView.text = roomObj.information
        let roomPhotos = roomObj.photos!
        let roomPhotosCount = roomPhotos.count
        imgPageControl.numberOfPages = roomPhotosCount
        for i in 0..<roomPhotosCount {
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            let imageName: String = roomPhotos[i].path ?? ""
            imageView.image = UIImage(named: roomPhotos[i].path ?? "")
            imageView.accessibilityLabel = roomPhotos[i].altText
            let xPos = CGFloat(i)*self.view.bounds.size.width
            imageView.frame = CGRect(x: xPos, y: 0, width: view.frame.size.width, height: imgScrollView.frame.size.height)
            imgScrollView.contentSize.width = view.frame.size.width*CGFloat(i+1)
            imgScrollView.addSubview(imageView)
        }
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.frame.width
        imgPageControl.currentPage = Int(page)
    }
    
}
