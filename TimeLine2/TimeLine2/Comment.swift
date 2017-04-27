//
//  Comment.swift
//  TimeLine2
//
//  Created by Bradley GIlmore on 4/24/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit
import CloudKit

class Comment: CloudKitSyncable {
 
    
    //MARK: - Keys
    
    static let typeKey = "Comment"
    static let textKey = "text"
    static let postKey = "post"
    static let timestampKey = "timestamp"
    
    
    //MARK: - Properties
    
    let text: String
    let timestamp: Date
    var post: Post?
    
    //MARK: - Initializers
    
    init(text: String, timestamp: Date = Date(), post: Post?
        ){
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
    
    
    //MARK: - CloudKitSync
    
    var cloudKitRecordID: CKRecordID?
    var recordType: String { return Comment.typeKey }
    
    convenience required init?(record: CKRecord) {
        
        guard let timestamp = record.creationDate,
            let text = record[Comment.textKey] as? String else { return nil }
        
        self.init(text: text, timestamp: timestamp, post: nil)
        cloudKitRecordID = record.recordID
    }
    
}

extension Comment: SearchableRecord {
    func matches(searchTerm: String) -> Bool {
        return text.contains(searchTerm)
    }
}

extension CKRecord {
    convenience init(_ comment: Comment) {
        guard let post = comment.post else { fatalError("Comment does not have a Post relationship") }
        let postRecordID = post.cloudKitRecordID ?? CKRecord(post).recordID
        let recordID = CKRecordID(recordName: UUID().uuidString)
        
        self.init(recordType: comment.recordType, recordID: recordID)
        
        self[Comment.timestampKey] = comment.timestamp as CKRecordValue?
        self[Comment.textKey] = comment.text as CKRecordValue?
        self[Comment.postKey] = CKReference(recordID: postRecordID, action: .deleteSelf)
    }
}
