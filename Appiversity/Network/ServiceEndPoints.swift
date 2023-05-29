//
//  ServiceEndPoints.swift
//  Appiversity
//
//  Created by Payam Karbassi on 29/05/2023.
//

import FirebaseDatabase
class ServiceEndPoints{
    static let DB_REF = Database.database().reference()
    static let SUBJECTS_REF = DB_REF.child("subjects")
}
