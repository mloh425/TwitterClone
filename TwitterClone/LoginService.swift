//
//  LoginService.swift
//  TwitterClone
//
//  Created by Sau Chung Loh on 8/4/15.
//  Copyright (c) 2015 Sau Chung Loh. All rights reserved.
//

import Foundation
import Accounts //Has all account classes to access Twitter Account

class LoginService {
  class func loginForTwitter(completionHandler : (String?, ACAccount?) -> (Void)) {
    let accountStore = ACAccountStore()
    let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
    accountStore.requestAccessToAccountsWithType(accountType, options: nil) { (granted, error) -> (Void) in
      if let error = error {
        completionHandler("Please Sign in", nil)
        return
      } else {
        if granted {
          if let account = accountStore.accountsWithAccountType(accountType).first as? ACAccount {
            completionHandler(nil, account)
          }
        } else {
          completionHandler("This app requires Twitter access.", nil)
        }
      }
    }
    
  }
}