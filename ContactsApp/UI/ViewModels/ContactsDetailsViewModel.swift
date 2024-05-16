//
//  ContactsDetailsViewModel.swift
//  ContactsApp
//
//  Created by Kaan Uzun on 14.05.2024.
//

import Foundation

class ContactsDetailsViewModel {
    var crepo = ContactsRepository()
    
    func update(contact:ContactsModel, contact_name:String, contact_number:String){
        crepo.update(contact: contact, contact_name: contact_name, contact_number: contact_number)
    }
}
