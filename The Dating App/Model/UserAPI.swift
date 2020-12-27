//
//  User.swift
//  The Dating App
//
//  Created by Michael Handkins on 12/27/20.
//

import Foundation
import FirebaseAuth
import Firebase
import ProgressHUD
import FirebaseStorage


class UserAPI {
    
    func signUp(withUsername username: String, email: String, password: String, image: UIImage?, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
            }
            
            if let authData = authDataResult {
                print(authData.user.email)
                var dict : Dictionary<String, Any> = [
                    "uid" : authData.user.uid,
                    "email" : authData.user.email,
                    "username" : username,
                    "profileImageUrl" : "",
                    "status" : "Welcome to The Dating App"
                ]
                
                guard let imageSelected = image else  {
                    ProgressHUD.showError("Please choose your profile picture")
                    return
                }
                
                guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
                    return
                }
                
                let storageRef = Storage.storage().reference(forURL: "gs://thedatingapp-f3ed6.appspot.com")
                let storageProfileRef = storageRef.child("profile").child(authData.user.uid)
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                storageProfileRef.putData(imageData, metadata: metadata) { (storageMetaData, error) in
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                    }
                    
                    storageProfileRef.downloadURL { (url, error) in
                        if let metaImageUrl = url?.absoluteString {
                            dict["profileImageUrl"] = metaImageUrl
                            
                            Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict) { (error, ref) in
                                if error == nil {
                                    onSuccess()
                                } else {
                                    onError(error!.localizedDescription)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
}
