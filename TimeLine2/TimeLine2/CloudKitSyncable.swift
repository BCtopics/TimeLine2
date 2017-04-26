//
//  CloudKitSyncable.swift
//  TimeLine2
//
//  Created by Bradley GIlmore on 4/26/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation
import CloudKit

protocol CloudKitSyncable {
    
    init?(record: CKRecord)
    
    var cloudKitRecordID: CKRecordID? { get set }
    var recordType: String { get }
    
}

extension CloudKitSyncable {
    
    // helper variable to determine if a CloudKitSyncable has a CKRecordID, which we can use to say that the record has been saved to the server
    var isSynced: Bool {
        if cloudKitRecordID != nil {
            return true
        } else {
            return false
        }
    }
    
    // a computed property that returns a CKReference to the object in CloudKit
    var cloudKitReference: CKReference? {
        guard let cloudKitRecordID = cloudKitRecordID else { return nil }
        let CKRef = CKReference(recordID: cloudKitRecordID, action: .none)
        return CKRef
    }
}
