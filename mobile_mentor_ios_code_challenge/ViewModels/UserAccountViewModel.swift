//
//  UserAccountViewModel.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/13/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

struct UserAccountViewModel {
    
    static var userEmail: String?
    
    static var userPassword: String?
    
    func setUserDict() {
        let userID = UserAccounts.userAccountEmail.count > 0 ? UserAccounts.userAccountEmail.count : 0
        
        UserAccounts.userAccountEmail[userID] = UserAccountViewModel.userEmail
        UserAccounts.userPasswords[userID] = UserAccountViewModel.userPassword
    }
    
    func getUserID(forEmailAddress email: String) -> Int {
        var userID: Int = 0
        
        for user in UserAccounts.userAccountEmail {
            if user.value == email {
                userID = user.key
            }
        }
        return userID
    }
    
}
