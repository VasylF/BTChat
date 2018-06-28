//
//  ChatViewController.swift
//  BTChat
//
//  Created by Mac on 27.06.18.
//  Copyright © 2018 VasylFuchenko. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController {
    
    var currentUser = ListOfUsers.shared.get(0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set current id
        self.senderId = currentUser.id
        self.senderDisplayName = currentUser.name
        
        self.messages = getMessages()
    }
  
    // all messages
    var messages = [JSQMessage]()
    
}

    // MARK: - extencion JSQMessagesViewController

extension  ChatViewController {
    
    func getMessages() -> [JSQMessage] {
        var funcMessages = [JSQMessage]()
        
        let senderIdFirst = ListOfUsers.shared.get(0).id
        let displayNameFirst = ListOfUsers.shared.get(0).name

        let senderIdSecond = ListOfUsers.shared.get(2).id
        let displayNameSecond = ListOfUsers.shared.get(2).name
        
        let message1 = JSQMessage(senderId: senderIdFirst, displayName: displayNameFirst, text: "How are you getting at?")
        let message2 = JSQMessage(senderId: senderIdSecond, displayName: displayNameSecond, text: "I am fine! How are you?")

        funcMessages.append(message1!)
        funcMessages.append(message2!)
        
        return funcMessages
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.row]
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let bubbleFactory = JSQMessagesBubbleImageFactory()
        let message = messages[indexPath.row]
        
        if currentUser.id == message.senderId {
            return bubbleFactory?.outgoingMessagesBubbleImage(with: .gray)
        } else {
            return bubbleFactory?.incomingMessagesBubbleImage(with: .blue)
        }
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        let message = messages[indexPath.row]
        let messageUserName = message.senderDisplayName
        
        return NSAttributedString(string: messageUserName!)
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        return 15
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        let message = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text)
        self.messages.append(message!)
        finishSendingMessage()
    }
    
}

// MARK: - extencion JSQMessagesViewController

extension ChatViewController: UserListTableViewControllerDelegate {
    
    func cellSelected(_ newUser: User) {
        self.currentUser = newUser
    }
    
}







