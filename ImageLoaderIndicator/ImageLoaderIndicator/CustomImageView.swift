//
//  CustomImageView.swift
//  ImageLoaderIndicator
//
//  Created by Rounak Jain on 24/01/15.
//  Copyright (c) 2015 Rounak Jain. All rights reserved.
//

import UIKit


class CustomImageView: UIImageView {
  
  let progressIndicatorView = CircularLoaderView(frame: CGRect.zero)
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    addSubview(self.progressIndicatorView)
    progressIndicatorView.frame = bounds

    progressIndicatorView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

    
    let url = URL(string: "http://www.raywenderlich.com/wp-content/uploads/2015/02/mac-glasses.jpeg")
    self.sd_setImage(with: url, placeholderImage: nil, options: .cacheMemoryOnly , progress: { [weak self](receivedSize, expectedSize) -> Void in
        self!.progressIndicatorView.progress = CGFloat(receivedSize)/CGFloat(expectedSize)
      }) { [weak self](image, error, _, _) -> Void in
        self!.progressIndicatorView.reveal()
    }
  }
  
}
