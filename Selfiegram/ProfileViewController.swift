//
//  ProfileViewController.swift
//  Selfiegram
//
//  Created by Jacqueline Chen on 2018-10-01.
//  Copyright © 2018 Jacqueline Chen. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var usernamelabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBAction func cameraButtonPressed(_ sender: Any) {
        let pickerController = UIImagePickerController()
        
        pickerController.delegate = self
        
        if TARGET_OS_SIMULATOR == 1 {
            
            pickerController.sourceType = .photoLibrary
        } else {
            pickerController.sourceType = .camera
            pickerController.cameraDevice = .front
            pickerController.cameraCaptureMode = .photo
        }
        
        self.present(pickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 1. When the delegate method is returned, it passes along a dictionary called info.
        //    This dictionary contains multiple things that maybe useful to us.
        //    We are getting an image from the UIImagePickerControllerOriginalImage key in that dictionary
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            // setting the compression quality to 90%
            if let imageData = image.jpegData(compressionQuality: 0.9),
                let imageFile = PFFile(data: imageData),
                let user = PFUser.current(){
               
                // avatarImage is a new column in our User table
                user["avatarImage"] = imageFile
                user.saveInBackground(block: { (success, error) -> Void in
                    if success {
                        // set our profileImageView to be the image we have picked
                        let image = UIImage(data: imageData)
                        self.profileImageView.image = image
                    }
                })
                
            }
            
        }
        
        //3. We remember to dismiss the Image Picker from our screen.
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         usernamelabel.text = "Jackie"
    }
//        usernamelabel.text = "Jackie"
        // Do any additional setup after loading the view.
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            if let user = PFUser.current() {
                usernamelabel.text = user.username
                
                if let imageFile = user["avatarImage"] as? PFFile {
                    
                    imageFile.getDataInBackground(block: { (data, error) -> Void in
                        if let imageData = data {
                            self.profileImageView.image = UIImage(data: imageData)
                        }
                    })
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


