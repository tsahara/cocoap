//
//  NetworkInterface.swift
//  cocoap
//
//  Created by Tomoyuki Sahara on 11/23/15.
//  Copyright © 2015 Tomoyuki Sahara. All rights reserved.
//

import Cocoa
import SystemConfiguration

class NetworkInterface {
    class func list() -> [String] {
        let store = SCDynamicStoreCreate(nil, "Playd", nil, nil)
        let val = SCDynamicStoreCopyValue(store, "State:/Network/Interface")
        guard (val != nil) else { return [] }
        return (val!["Interfaces"] as! [String]).sort()
    }
}
