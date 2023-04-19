//
//  Constants.swift
//  TwitterClone
//
//  Created by Marcos Michel on 19/04/23.
//

import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_image")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")