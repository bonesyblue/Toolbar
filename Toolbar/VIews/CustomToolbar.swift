//
//  CustomToolbar.swift
//  Toolbar
//
//  Created by Jonathan Bones on 19.10.21.
//

import AppKit
import SwiftUI

struct ToolbarIncrementButton: View {
    var action: () -> Void
    
    var body: some View {
        VStack{
            Button(
                action: action,
                label: {
                    Image("plus.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                }
            )
        }.padding([.leading, .trailing], 10)
    }
}

class CustomToolbar: NSToolbar, NSToolbarDelegate {
    private let incrementButton = NSToolbarItem.Identifier(rawValue: "Increment")
    
    var buttonView: NSView?
    
    override init(identifier: NSToolbar.Identifier) {
        super.init(identifier: identifier)
        self.delegate = self
    }
    
    convenience init(
        identifier: NSToolbar.Identifier,
        incrementButton: NSView
    ) {
        self.init(identifier: identifier)
        self.buttonView = incrementButton
    }
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [incrementButton]
    }
    
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [incrementButton]
    }
    
    func toolbar(
        _ toolbar: NSToolbar,
        itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
        willBeInsertedIntoToolbar flag: Bool
    ) -> NSToolbarItem? {
        switch itemIdentifier {
        case incrementButton:
            let item = NSToolbarItem(itemIdentifier: itemIdentifier)
            item.view = buttonView
            item.maxSize = NSSize(width: 24, height: 24)
            return item
        default:
            return nil
        }
    }

}
