//
//  AppDelegate.swift
//  cocoap
//
//  Created by Tomoyuki Sahara on 11/23/15.
//  Copyright © 2015 Tomoyuki Sahara. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        print("list of network interfaces: \(NetworkInterface.list())")
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

