//
//  FirebaseHelper.swift
//  smufood
//
//  Created by Samuel Hunter on 9/28/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import Foundation

class FirebaseHelper {
    
    var myRootRef : Firebase
    
    let fetchHandler: [OpenHours] -> Void //clojure that returns nothing
    
    private var multiDataPrivate = [OpenHours]() //private array of dicts (to prevent modifying the same array on multiple threads)
    
    private var firebaseObservationHandle: UInt?
    
    let queue = dispatch_queue_create("com.firebasehelp.queue", DISPATCH_QUEUE_SERIAL)
    
    init(fetchHandler: [OpenHours] -> Void) {
        myRootRef = Firebase(url: "https://smufood.firebaseio.com/")
        
        self.fetchHandler = fetchHandler
        
        //        myRootRef.observeEventType(.ChildAdded, withBlock: { snapshot in
        //            var tableData = ["posterName" : snapshot.value.objectForKey("posterName")!]
        //            tableData["questionText"] = snapshot.value.objectForKey("questionText")!
        //            self.multiData.append(tableData)
        //
        //            println(self.multiData.count)
        //
        //            fetchHandler()
        //        })
    }
    
    func startObserving() {
        multiDataPrivate.removeAll()
        // TODO: look at closure capture lists and what a strong reference cycle is (and how to break one like we're doing here!)
        firebaseObservationHandle = myRootRef.observeEventType(.ChildAdded, withBlock: { [weak self] snapshot in
            if let strongSelf = self {
                let dateForHours = snapshot.value["dateForHours"] as String
                println(dateForHours)
                
                let tableData = OpenHours()
                /*[
                "posterName": posterName,
                "questionText": questionText,
                "datePosted": datePosted,
                "emailAddress" : emailAddress
                //"status" : status
                //how do I get an array?
                ]*/
                
                dispatch_async(strongSelf.queue) {
                    strongSelf.multiDataPrivate += [tableData]
                    
                    strongSelf.fetchHandler(strongSelf.multiDataPrivate)
                }
            }
        })
    }
    
    func stopObserving() {
        if let handle = firebaseObservationHandle {
            myRootRef.removeObserverWithHandle(handle)
        }
    }
}