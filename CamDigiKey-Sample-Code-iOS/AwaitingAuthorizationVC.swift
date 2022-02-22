//
//  AwaitingAuthorizationVC.swift
//  CamDigiKey-Sample-Code-iOS
//
//  Created by Techo Startup Center on 22/2/22.
//

import UIKit

class AwaitingAuthorizationVC: UIViewController {
    
    var delegate: CamDigiKeyClientDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK : Add your own design for awaiting screen
        
        let button = UIButton()
        button.setTitle("Cancel Login", for: .normal)
        button.sizeToFit()
        button.setTitleColor(.red, for: .normal)
        button.center = view.center
        button.addAction(.init(handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }), for: .touchUpInside)
        view.addSubview(button)
    }
}
