import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let db = Firestore.firestore()
        db.collection("items").getDocuments(completion: { (querySnapshort, err) in
            if let err = err {
                debugPrint("Error getting document: \(err)")
            } else {
                if let documents = querySnapshort?.documents {
                    for document in  documents {
                        debugPrint("\(document.documentID) => \(document.data())");
                    }
                }
            }
        })

    }
    


}

