//
//  DatabaseHandler.swift


import Foundation
import SQLite3
import UIKit

class DatabaseHandler{
    let databaseName : String = "University.db"
    var db : OpaquePointer! = nil
    
    init() {
        prepareDatafile()
        db = openDatabase()
    }
    
  
    func getStudents()->[Student]{
        var students : [Student] = []
        
        let queryStatementString = "SELECT * FROM Student"
        var queryStatement: OpaquePointer? = nil
        // 1
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            // 2
            while  sqlite3_step(queryStatement) == SQLITE_ROW
            {
                let student = Student()
                
                let _id = sqlite3_column_int(queryStatement, 0)
                student.id =  Int(_id)
                
                let columnEnglish = sqlite3_column_text(queryStatement, 1)
                if(columnEnglish != nil){
                    student.name = String(cString: columnEnglish!)
                    student.rollNo = String(cString: columnEnglish!)
                    student.descipline = String(cString: columnEnglish!)
                }
//                let imageBytes = sqlite3_column_bytes(queryStatement, 2)
//                let imageBlob = sqlite3_column_blob(queryStatement, 2)
//                if(imageBlob != nil){
//                     let imageData = NSData(bytes: imageBlob, length: Int(imageBytes))
//                    student.Picture = UIImage(data: imageData as Data)
//
//                }
//                if student.Picture == nil {
//                    let imageBase64 = sqlite3_column_text(queryStatement, 2)
//                    let imageData : Data = Data(base64Encoded: String(cString: imageBase64!), options: .ignoreUnknownCharacters)!
//                    student.Picture = UIImage(data: imageData)
//                }
                
                students.append(student)
            }
        } else {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("'get Student failed:\(errmsg)")
        }
        sqlite3_finalize(queryStatement)
        return students
    }
    
  
    func executeSelect(query: String)->OpaquePointer{
        
        var queryStatement: OpaquePointer? = nil
        // 1
        if sqlite3_prepare_v2(db, query, -1, &queryStatement, nil) == SQLITE_OK {
        
        } else {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("'insert into ':: could not be prepared::\(errmsg)")
        }
        return queryStatement!
    }
    
    func executeQuery(query: String)->Bool{
        
        var queryStatement: OpaquePointer? = nil
        // 1
        if sqlite3_prepare_v2(db, query, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure inserting hero: \(errmsg)")
            }
            else{
                sqlite3_finalize(queryStatement)
                return true
            }
            
        } else {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("'insert into ':: could not be prepared::\(errmsg)")
        }
        sqlite3_finalize(queryStatement)
        return false
    }
    
    /////////////////////////////
    //Copy database for fist time
    /////////////////////////////
    func prepareDatafile()
    {
        let docUrl=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print(docUrl)
        let fdoc_url=URL(fileURLWithPath: docUrl).appendingPathComponent(databaseName)
        
        let localUrl=Bundle.main.url(forResource: "University", withExtension: "db")
        print(localUrl?.path ?? "")
        
        let filemanager=FileManager.default
        
        if !FileManager.default.fileExists(atPath: fdoc_url.path){
            do{
                try filemanager.copyItem(atPath: (localUrl?.path)!, toPath: fdoc_url.path)
                
                print("Database copied to simulator-device")
            }catch
            {
                print("error while copying")
            }
        }
        else{
            print("Database alreayd exists in similator-device")
        }
    }
    

    
    /////////////////////////////////////
    /////Open Connection to Database
    ////////////////////////////////////
    func openDatabase() -> OpaquePointer? {
        
        let docUrl=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print(docUrl)
        let fdoc_url=URL(fileURLWithPath: docUrl).appendingPathComponent(databaseName)
        
        var db: OpaquePointer? = nil
        
        if sqlite3_open(fdoc_url.path, &db) == SQLITE_OK {
            print("DB Connection Opened, Path is :: \(fdoc_url.path)")
            return db
        } else {
            print("Unable to open database. Verify that you created the directory described " +
                "in the Getting Started section.")
            return nil
        }
        
    }
    

}
