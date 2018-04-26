//
//  CameraView.swift
//  reactSwiftCamera
//
//  Created by Carlos Valarezo Loaiza on 4/26/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import UIKit
import AVFoundation

class CameraView: UIView {
  
  var captureSession: AVCaptureSession?
  var videoPreviewLayer: AVCaptureVideoPreviewLayer?
  var previewView: UIView!
  
  let view = UIView()
  
  public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
  }
  
  public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
     let testFrame : CGRect = CGRect(x:0,y:0,width:screenWidth,height:screenHeight)
    
    
    let testView : UIView = UIView(frame: testFrame)
     testView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
     testView.alpha=0.5
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100,
                                      height: 50))
    label.text = "This is Swift"
    self.addSubview(label)
    self.addSubview(testView)
    
    /**/
    
    
    print("grabando...")
    
    let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
    do {
      let input = try AVCaptureDeviceInput(device: captureDevice! )
      captureSession = AVCaptureSession()
      captureSession?.addInput(input)
      videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
      videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
      videoPreviewLayer?.frame = testView.layer.bounds
      testView.layer.addSublayer(videoPreviewLayer!)
      captureSession?.startRunning()
      let outputFileName = NSUUID().uuidString
      let outputFilePath = (NSTemporaryDirectory() as NSString).appendingPathComponent((outputFileName as NSString).appendingPathExtension("mov")!)
      /* movieFileOutput?.startRecording(toOutputFileURL: URL(fileURLWithPath: outputFilePath), recordingDelegate: self as! AVCaptureFileOutputRecordingDelegate) */
    } catch {
      print(error)
    }
    
    
    
    /**/
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("error...")
  }
  
  
  @IBAction func takeVideo() {
   
    
  }
  
}


