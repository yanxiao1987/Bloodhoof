//
//  LoginVM.swift
//  Bloodhoof
//
//  Created by Xiao Yan on 7/29/17.
//  Copyright © 2017 Xiao Yan. All rights reserved.
//

import Foundation
import RxSwift

struct LoginVM {
    let disposeBag = DisposeBag()
    
    let username = Variable<String>("")
    let password = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(self.username.asObservable(), self.password.asObservable()) {
            return self.validUsername($0) && self.validPassword($1)
        }
    }
    
    private func validUsername(_ username: String) -> Bool {
        return username.characters.count > 0
    }
    
    private func validPassword(_ password: String) -> Bool {
        return password.characters.count > 0
    }
}
