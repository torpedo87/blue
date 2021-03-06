//
//  AppDelegate.swift
//  MyVending
//
//  Created by Jun woo Park on 2017. 3. 21..
//  Copyright © 2017년 Jun woo Park. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        //vc 사용하려고
        let vc = window?.rootViewController as! ViewController
        
        //재고배열사전을 스토리지에 넣기(userdefault 스토리지는 appdelegate에서만 사용해도 되나보네)
        let stocks = vc.getStocks()
        
        //압축해라
        let data = NSKeyedArchiver.archivedData(withRootObject: stocks)
        
        //스토리지에 저장
        UserDefaults.standard.set(data, forKey: "stocks")
        print("applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        let vc = window?.rootViewController as! ViewController
        
//        if let stocks = UserDefaults.standard.object(forKey: "stocks") as? [String:[Beverage]] {
//            if stocks.count != 0 {
//                vc.changeStocks(stocks: stocks)
//            }
//        }
        print("applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        //뷰컨트롤러 정보 이용하려고
        let vc = window?.rootViewController as! ViewController
        
        //스토리지에 재고 있으면 출력하고 재고배열 만들어 넣어라
        if let stocks = UserDefaults.standard.object(forKey: "stocks") as? [String:[Beverage]] {
            if stocks.count != 0 {
                print("application", stocks)
                vc.setStocks(unarch: stocks)
            }
        }
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

