//
//  notificationViewModel.swift
//  Swifties
//
//  Created by Pavneet Cheema on 4/19/24.
//

import Foundation
import Firebase
struct notification: Identifiable{
    var id: String { docid }
    var docid: String
    let caregiverid, dependentid, pli: String
    
    init(docid: String, data: [String: Any]){
        self.docid = docid
        self.caregiverid = data["Caregiver ID"] as? String ?? ""
        self.dependentid = data["Dependent ID"] as? String ?? ""
        self.pli = data["PLI"] as? String ?? "fff"
    }
}
struct recent: Identifiable{
    var id: String { docid }
    var docid: String
    let  dependentid, dependentName, pli: String
    
    init(docid: String, data: [String: Any]){
        self.docid = docid
        self.dependentName = data["Dependent Name"] as? String ?? ""
        self.dependentid = data["Dependent ID"] as? String ?? ""
        self.pli = data["PLI"] as? String ?? "fff"
    }
}
class notificationViewModel: ObservableObject{
    @Published var error: String = "null"
    @Published var ListOfNotif = [notification]()
    @Published var ListOfRecent = [recent]()
    let dependent: User?
    let viewModel = AuthViewModel()
    var currentU: User?
    
    init(dependent: User?){
        self.dependent = dependent
        self.currentU = viewModel.currentUser
        
        fetchNotification()
    }
    func fetchNotification(){
        guard let FromId = dependent?.id else {return}
        guard let Toid = AuthViewModel.UserId else {return}//this might cause some issues
        self.error = "hi"
        
        
        Firestore.firestore().collection("notifications").document(Toid)
            .collection(FromId)
            .addSnapshotListener { querySnapshot, error in
                if let error = error{
                    print(error)
                    return
                }
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added{
                        let data = change.document.data()
                        let docId = change.document.documentID
                        let notif = notification(docid: docId,data: data)
                        self.ListOfNotif.append(notif)
                        //self.ListOfNotif.insert(notif, at: 0)


                    }
                })
            }
    }
    func fetchrecent(){
        guard let Toid = AuthViewModel.UserId else {return}
        Firestore.firestore().collection("recent").document(Toid).collection("notif")
            .addSnapshotListener { querySnapshot, error in
                if let error = error{
                    print(error)
                    return
                }
                querySnapshot?.documentChanges.forEach({ change in
                    if change.type == .added{
                        let data = change.document.data()
                        let docId = change.document.documentID
                        let notif = recent(docid: docId,data: data)
                        //self.ListOfNotif.append(notif)
                        self.ListOfRecent.insert(notif, at: 0)


                    }
                })

            }
    }
}
