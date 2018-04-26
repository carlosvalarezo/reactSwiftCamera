//
//  CameraViewController.swift
//  reactSwiftCamera
//
//  Created by Carlos Valarezo Loaiza on 4/26/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
  
  var captureSession: AVCaptureSession?
  var videoPreviewLayer: AVCaptureVideoPreviewLayer?
  
  @IBOutlet weak var recordButton: UIButton!
  @IBOutlet weak var previewView: UIView!
  @IBOutlet weak var stopButton: UIButton!
  
  private var movieFileOutput: AVCaptureMovieFileOutput?
  
  @IBAction func takeVideo() {
    print("grabando...")
    
    let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
    do {
      let input = try AVCaptureDeviceInput(device: captureDevice! )
      captureSession = AVCaptureSession()
      captureSession?.addInput(input)
      videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
      videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
      videoPreviewLayer?.frame = view.layer.bounds
      previewView.layer.addSublayer(videoPreviewLayer!)
      captureSession?.startRunning()
      let outputFileName = NSUUID().uuidString
      let outputFilePath = (NSTemporaryDirectory() as NSString).appendingPathComponent((outputFileName as NSString).appendingPathExtension("mov")!)
      movieFileOutput?.startRecording(toOutputFileURL: URL(fileURLWithPath: outputFilePath), recordingDelegate: self as! AVCaptureFileOutputRecordingDelegate)
    } catch {
      print(error)
    }
    
  }
  
  @IBAction func stopVideo(_ stopButton: UIButton) {
    print("detenido...")
    captureSession?.stopRunning()
    movieFileOutput?.stopRecording()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
}


