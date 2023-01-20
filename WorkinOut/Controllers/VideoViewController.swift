//
//  VideoViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 7/13/22.
//
// yeah it wouldn't be taht hard
// but would I have to publish another app or could I upload the new project as a new build
import UIKit
import AVKit
import MobileCoreServices

class VideoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addVideoButton(_ sender: Any) {
        VideoHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
    }
    
}

// MARK: - UIImagePickerControllerDelegate
extension VideoViewController: UIImagePickerControllerDelegate {
}

// MARK: - UINavigationControllerDelegate
extension VideoViewController: UINavigationControllerDelegate {
}
