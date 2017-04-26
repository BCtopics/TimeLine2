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
