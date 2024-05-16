//
//  ContactsRepository.swift
//  ContactsApp
//
//  Created by Kaan Uzun on 14.05.2024.
//

import Foundation
import RxSwift
import CoreData

class ContactsRepository {
    
    var contactsList = BehaviorSubject<[ContactsModel]>(value: [ContactsModel]())
    
    let context = appDelegate.persistentContainer.viewContext
    
    func contactSave(contact_name:String, contact_number:String) {
        let contact = ContactsModel(context: context)
        contact.kisi_ad = contact_name
        contact.kisi_tel = contact_number
        
        appDelegate.saveContext()
    }
    
    func update(contact:ContactsModel, contact_name:String, contact_number:String){
        contact.kisi_ad = contact_name
        contact.kisi_tel = contact_number
        
        appDelegate.saveContext()
        
    }
    
    
    func search(searchKey:String){
        do {
            let fetchRequest = ContactsModel.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "kisi_ad CONTAINS [c] %@", searchKey)
            let list = try context.fetch(fetchRequest)
            contactsList.onNext(list)//Triggering
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func delete(contact:ContactsModel){
        context.delete(contact)
        
        appDelegate.saveContext()
    }
    
    func contactsLoadUp(){
        var list = [ContactsModel]()
        
        
        do {
            let fetchRequest = ContactsModel.fetchRequest()
            let list = try context.fetch(fetchRequest)
            contactsList.onNext(list)//Triggering
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
