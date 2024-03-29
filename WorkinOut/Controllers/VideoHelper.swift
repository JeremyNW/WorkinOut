//
//  VideoHelper.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 7/13/22.
//

import MobileCoreServices
import UIKit

enum VideoHelper {
  static func startMediaBrowser(
    delegate: UIViewController & UINavigationControllerDelegate & UIImagePickerControllerDelegate,
    sourceType: UIImagePickerController.SourceType
  ) {
    guard UIImagePickerController.isSourceTypeAvailable(sourceType)
      else { return }

    let mediaUI = UIImagePickerController()
    mediaUI.sourceType = sourceType
    mediaUI.mediaTypes = [kUTTypeMovie as String]
    mediaUI.allowsEditing = true
      mediaUI.delegate = delegate
    delegate.present(mediaUI, animated: true, completion: nil)
  }
}
