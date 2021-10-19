//
//  AppDelegate.swift
//  Toolbar
//
//  Created by Jonathan Bones on 19.10.21.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!
    
    let counter = CounterState()


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environmentObject(counter.state)
        // Create and configure the Toolbar instance
        let toolbarButton = NSHostingView(
            rootView: ToolbarIncrementButton(
                action: { self.counter.state.count += 1 }
            )
        )
        let toolbar = CustomToolbar(
            identifier: "CustomToolbar",
            incrementButton: toolbarButton
        )
        toolbar.displayMode = .iconOnly

        // Create the window and set the content view.
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.isReleasedWhenClosed = false
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        
        window.toolbar = toolbar
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

