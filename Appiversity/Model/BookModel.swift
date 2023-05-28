//
//  BookModel.swift
//  Appiversity
//
//  Created by Payam Karbassi on 28/05/2023.
//

import Foundation
enum BookParts: String{
    case subjectTitle, levelTitle , chapterTitle, sectionTitle
}

struct BookModel {
    let subjectTitle: String
    let levelTitle: String
    let chapterTitle:String
    let sectionTitle:String
}

struct AppUser {
    let email: String
    let uid: String
}
