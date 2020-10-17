import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    // MARK: - Public
    
    /// Check if username and email is avaiable
    /// - Parameters
    ///     - email : String representing email
    ///     - username : String representing username
    public func canCreateNewUser(with email: String, user: String, password: String, completion: (Bool) -> Void ){
        completion(true)
    }
    
    /// Insert new user to database
    /// - Parameters
    ///     - email : String representing email
    ///     - username : String representing username
    ///     - completion : Async callback for result if database enrry succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        let key = email.safeDatabaseKey()
        database.child(key).setValue(["username":username]){ error, _ in
            if error == nil {
                // succeded
                completion(true)
                return
            }
            else {
                // failed
                completion(false)
                return
            }
        }
    }
}
