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
    
    func signIn(email: String, password: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (authData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            print(authData?.user.uid)
            onSuccess()
        }
        
    }
    
    func signUp(withUsername username: String, email: String, password: String, image: UIImage?, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
            }
            
            if let authData = authDataResult {
                print(authData.user.email)
                var dict : Dictionary<String, Any> = [
                    UID : authData.user.uid,
                    EMAIL : authData.user.email,
                    USERNAME : username,
                    PROFILE_IMAGE_URL : "",
                    STATUS : "Welcome to The Dating App"
                ]
                
                guard let imageSelected = image else  {
                    ProgressHUD.showError(ERROR_EMPTY_PHOTO)
                    return
                }
                
                guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
                    return
                }
                
                let storageProfile = Ref().storageSpecificProfile(uid: authData.user.uid)
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                
                StorageService.savePhoto(username: username, uid: authData.user.uid, imageData: imageData, metadata: metadata, storageProfileRef: storageProfile, dict: dict) {
                    onSuccess()
                } onError: { (errorMessage) in
                    onError(errorMessage)
                }
            }
        }
    }
    
}
