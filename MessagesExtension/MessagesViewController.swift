//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by asastry on 10/21/16.
//  Copyright © 2016 asastry. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    // User Map - dictionary of luid => screen names
    var playerMap:[String: String]?
    
    // Player Data Table - array of Player Objects
    var players:[Player]?
    
    // Clock
    
    // Player Object
    // - money
    // - activity object
    //    - busyUntilTS
    //    - busyWithTaskID
    // - hearts
    // - requests sent
    // - inbox
    
    required init?(coder aDecoder: NSCoder) {
        // self.playerMap = ["a", "b"]
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("*** Entered viewDidLoad()")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("*** Entered didReceiveMemoryWarning()")
        
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
        
        print("*** Entered willBecomeActive()")
        
        super.willBecomeActive(with: conversation)
        
        // Present the view controller appropriate for the conversation and presentation style.
        presentViewController(for: conversation, with: .compact)
        
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
        
        print("*** Entered didResignActive()")
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
        
        print("*** Entered didReceive()")
        
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
        
        print("*** Entered didStartSending()")
        
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
        
        print("*** Entered didCancelSending()")
        
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
        
        print("*** Entered willTransition()")
        
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
        
        print("*** Entered didTransition()")
    }
    
    public func registerLocalUser() {
        let userID = activeConversation?.localParticipantIdentifier.uuidString
        print("Registering local user: \(userID!)")
        
        // Register user on the user Map
        // Create starting blob in the player object array
    }
    
    private func presentViewController(for conversation: MSConversation, with presentationStyle: MSMessagesAppPresentationStyle) {
        // Determine the controller to present.
        let controller: UIViewController
        controller = instantiateUserRegController()
        
        /* if presentationStyle == .compact {
            // Show the starting/joining screen
            controller = instantiateUserRegController()
        }
        else {
            // Do nothing
        }*/
        
        // Remove any existing child controllers.
        for child in childViewControllers {
            child.willMove(toParentViewController: nil)
            child.view.removeFromSuperview()
            child.removeFromParentViewController()
        }
        
        // Embed the new controller.
        addChildViewController(controller)
        
        controller.view.frame = view.bounds
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        
        controller.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        controller.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        controller.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        controller.didMove(toParentViewController: self)
    }
    
    private func instantiateUserRegController() -> UIViewController {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: UserRegistrationViewController.storyboardIdentifier) as? UserRegistrationViewController else { fatalError("Unable to instantiate an UserRegistrationViewController from the storyboard") }
        
        controller.msgController = self
        
        return controller
    }


}
