//
//  CameraView.swift
//  reactSwiftCamera
//
//  Created by Carlos Valarezo Loaiza on 4/26/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import Foundation

import UIKit

class CameraView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100,
                                      height: 50))
    label.text = "This is Swift"
    self.addSubview(label)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("error...")
  }
  
}
