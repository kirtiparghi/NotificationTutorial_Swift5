//
//  ViewController.swift
//  LocationNotificationDemo
//
//  Created by Kirti Parghi on 6/29/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (granted, error) in
            if granted {
                print("Yes")
            }
            else {
                print("No")
            }
        }
    }
    
    @IBAction func sendNotification(_ sender: Any) {
        //1
        let content = UNMutableNotificationContent()
        content.title = "My Notification"
        content.subtitle = "Subtitle goes here"
        content.body = "Body goes here"
        
        //2
        let imgName = "profile_pic_noimg"
        guard let imageURL = Bundle.main.url(forResource: imgName, withExtension: "png") else { return }
        
        let attachment = try! UNNotificationAttachment(identifier: imgName, url: imageURL, options: .none)
        
        content.attachments = [attachment]
        
        //3
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        //4
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
