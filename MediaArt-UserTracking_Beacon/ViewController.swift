//
//  ViewController.swift
//  MediaArt-UserTracking_Beacon
//
//  Created by Masaki Kobayashi on 2014/10/05.
//  Copyright (c) 2014年 Masaki Kobayashi. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    
    // LocationManager
    var myPheripheralManager:CBPeripheralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // PeripheralManagerを定義.
        myPheripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        
        // iBeaconのUUID.
        let myProximityUUID = NSUUID(UUIDString: "FF2BB40C-6C0E-1801-A386-001C4DB9EE23")
        
        // iBeaconのIdentifier.
        let myIdentifier = ""
        
        // Major.
        let myMajor : CLBeaconMajorValue = 1
        
        // Minor.
        let myMinor : CLBeaconMinorValue = 1
        
        // BeaconRegionを定義.
        let myBeaconRegion = CLBeaconRegion(proximityUUID: myProximityUUID, major: myMajor, minor: myMinor, identifier: myIdentifier)
        
        // Advertisingのフォーマットを作成.
        let myBeaconPeripheralData = myBeaconRegion.peripheralDataWithMeasuredPower(nil)
        
        // Advertisingを発信.
        myPheripheralManager.startAdvertising(myBeaconPeripheralData)
        
    }
}
