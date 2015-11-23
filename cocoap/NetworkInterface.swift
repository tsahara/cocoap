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
        func callback(store: SCDynamicStore, array: CFArray, context: UnsafeMutablePointer<Void>) -> Void {
            print("callbacked: \(array)")
        }

        let store = SCDynamicStoreCreate(nil, NSBundle.mainBundle().bundleIdentifier!, callback, nil)!
        let keys = [ SCDynamicStoreKeyCreateNetworkInterface(nil, kSCDynamicStoreDomainState) ]
        SCDynamicStoreSetNotificationKeys(store, keys, nil)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), SCDynamicStoreCreateRunLoopSource(nil, store, 0), kCFRunLoopDefaultMode)
        
        let val = SCDynamicStoreCopyValue(store, "State:/Network/Interface")
        guard (val != nil) else { return [] }
        return (val!["Interfaces"] as! [String]).sort()
    }
}

