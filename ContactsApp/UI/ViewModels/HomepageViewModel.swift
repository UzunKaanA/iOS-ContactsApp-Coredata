//
//  HomepageViewModel.swift
//  ContactsApp
//
//  Created by Kaan Uzun on 14.05.2024.
//

import Foundation
import RxSwift

class HomepageViewModel {
    var hrepo = ContactsRepository()
    var contactsList = BehaviorSubject<[ContactsModel]>(value: [ContactsModel]())
    
    init(){
        contactsList = hrepo.contactsList
    }
    
    func search(searchKey:String){
        hrepo.search(searchKey: searchKey)
    }
    
    func delete(contact:ContactsModel){
        hrepo.delete(contact: contact)
        contactsUpload()
    }
    
    func contactsUpload(){
        hrepo.contactsLoadUp()
    }
}
