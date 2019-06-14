//
//  InfoVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by ddd on 14/06/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet var currVer: UILabel!
    @IBOutlet var theLatestVer: UILabel!
    
    var currVerStr: String = "default"
    var appStoreVerStr: String = "default"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currVerStr = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "error"
        currVer.text = currVerStr
        
        appStoreVerStr = findVerStr()
        //theLatestVer.text = appStoreVerStr
        //앱스토어에 올라가기 전까지는 일단 그냥 1.0이라고 최신 버전을 써넣는다.
        theLatestVer.text = "1.0"
        
    }
}

extension InfoVC {
    func findVerStr() -> String {
        let appBundleIDStr: String = "default"
        
        guard let findVersionURL = URL(string: "http://itunes.apple.com/lookup?bundleID=\(appBundleIDStr)"),
        let findVersionData = try? Data(contentsOf: findVersionURL),
        let findVersionJson = try? JSONSerialization.jsonObject(with: findVersionData, options: .allowFragments) as? [String: Any],
        let results = findVersionJson["results"] as? [[String: Any]],
        results.count > 0,
        let theLastestVerStr = results[0]["version"] as? String
            else { return "error" }
        return theLastestVerStr
    }
}
