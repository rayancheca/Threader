//
//  ImageUploader.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/16/24.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do{
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        }catch {
            print("DABUG: Failed to upload image with error: \(error.localizedDescription)")
            return nil
        } // end do catch 
    } // end func upload image
} // end struct image uploader

