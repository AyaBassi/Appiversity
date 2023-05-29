//
//  HomeVCViewModel.swift
//  Appiversity
//
//  Created by Payam Karbassi on 28/05/2023.
//

import FirebaseAuth
import FirebaseDatabase

class HomeVCViewModel {

    func userSignedOut(apiService: ServiceProtocol) -> Result<Bool, NetworkError>{
        guard Auth.auth().currentUser != nil else {return .failure(.noUserWasSignedInOrFound)}
        do {
            try apiService.signUserOut()
            return .success(true)
        }catch{
            if let error = error as NSError? {
                guard let errorCode = AuthErrorCode.Code(rawValue: error.code) else {
                    return .failure(.unknownError)
                }
                
                switch errorCode {
                case .networkError: return .failure(.networkError)
                default:            return .failure(.couldNotSignUserOut)
                }
            }
        }
    }
    
    
    func prepareSubjectsDataAndReturnIt(completion:@escaping ([String])->Void) {
        Service.shared.fetchSubject { snapshot in
            var subjectArray : [String] = []
            for childSnap in snapshot.children.allObjects {
                guard let snap = childSnap as? DataSnapshot else {return}
                guard let dictonaries = (snap.value as? NSDictionary) else {return}
                for dict in dictonaries {
                    guard let dictionary = dictonaries[dict.key as Any] as? [String:Any] else {continue}
                    for (key,val) in dictionary {
                        if key == "subject" {
                            subjectArray.append(val as? String ?? "")
                        }
                    }
                }
            }
            completion(subjectArray)
        }
    }
}


//    func fetchSubjects(){
//
//        ServiceEndPoints.SUBJECTS_REF.observeSingleEvent(of: .value) { snapshot in
//            for childSnap in snapshot.children.allObjects {
//                guard let snap = childSnap as? DataSnapshot else {return}
//                guard let dictonaries = (snap.value as? NSDictionary) else {return}
//                for dict in dictonaries {
//                    guard let dictionary = dictonaries[dict.key as Any] as? [String:Any] else {continue}
//                    for (key,val) in dictionary {
//                        if key == "subject" {
//                            listArray.append(val as? String ?? "")
//                        }
//                    }
//                }
//            }
//            //self.subjects = listArray
//            listArray.removeAll()
//            self.refreshControl.endRefreshing()
//        }
//    }
