//
//  SendNotif.swift
//  swiftiesBoard
//
//  Created by Pavneet Cheema on 3/28/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
//import Swifties

class SendNotif{
    //var UserName: String
    var currentDependent: Dependent?
    //var user: FirebaseAuth.User?
    init(){
        fetchfromKeychain()
        Task{
            await fetchUser()
        }
        
//
    }
    
    //fetch the user logged into the container app
    
    func fetchfromKeychain(){
        do {
          try FirebaseManager.shared.auth.useUserAccessGroup("com.Swifties.shareUser") //adding the user state to the acess group. ps
        } catch let error as NSError {
          print("Error changing user access group: %@", error)
        }
        print("fetched from keychain")

    }
    //fetch the user info from the firebase
    
    func fetchUser() async{
        guard let dependentId = FirebaseManager.shared.auth.currentUser?.uid else {return}
        guard let snapshot = try? await FirebaseManager.shared.firestore.collection("users").document(dependentId).getDocument() else { print("Could not retreive user"); return}
        self.currentDependent = try? snapshot.data(as: Dependent.self)
    }
    func getUserName() async -> String {
        let userName = currentDependent!.fullName
        return userName
    }
    
    //send notification to the caregiver
    
    func handleSend(notif: String) {
        let redactedPLI =  String(notif.suffix(4))
        guard let dependentId = FirebaseManager.shared.auth.currentUser?.uid else {return} //uid from which the message wass sent

        print(currentDependent!.caregivers)
        for caregiverID in currentDependent!.caregivers {
            let document = Firestore.firestore().collection("notifications").document(caregiverID).collection(dependentId).document() //table for the sensitive info notification
            
            let NotifData = ["Caregiver ID": caregiverID, "Dependent ID": dependentId, "PLI": redactedPLI]
            document.setData(NotifData)
            
            recentNotif(id: caregiverID, pli: redactedPLI)
        }
        print("user uid is",dependentId)
        //print(vm.currentUser.uid)
    }
    private func recentNotif(id: String, pli: String){
        guard let dependentId = FirebaseManager.shared.auth.currentUser?.uid else {return}
        guard let dependentName = currentDependent?.fullName else {return}
        let doc = FirebaseManager.shared.firestore.collection("recent").document(id).collection("notif").document()
        let NotifData = ["Dependent ID": dependentId,"Dependent Name": dependentName, "PLI": pli, "timestamp": Timestamp()] as [String : Any]
        doc.setData(NotifData)
    }
}
