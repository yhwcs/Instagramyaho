//
//  LoadingViewController.swift
//  Instagramyaho
//
//  Created by RelMac User Exercise1 on 2021/06/01.
//

import Foundation
import UIKit

@IBDesignable
class LoadingViewController: UIViewController {
    private var loadingView: LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoadingView()
    }
    
    func setLoadingView() {
        let loadingViewFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
        loadingView = LoadingView(frame: loadingViewFrame)
        guard let loading = loadingView else {return}
        loading.center = self.view.center
        loading.startAnimation()
        self.view.addSubview(loading)
    }
}

