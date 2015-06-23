//
//  DetailViewController.swift
//  HackingWithSwift1
//
//  Created by Alexander Handy on 21/06/2015.
//  Copyright (c) 2015 Alexander Handy. All rights reserved.
//

import Social
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!

    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        //these if let structure are for unwrapping earlier declaring optional variables in a safe way
        if let detail = detailItem {
            if let imageView = detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        //action below is method that is tapped
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
    }
    
    //brings up sharing activity bar
    func shareTapped() {
//        let activity = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
//        presentViewController(activity, animated: true, completion: nil)
        let social = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        // why have to explicit state parameter above but not below
        social.setInitialText("Hello world, buy my app")
        social.addImage(detailImageView.image!)
        social.addURL(NSURL(string: "http://www.photolib.ngaa.gov/nsll"))
        presentViewController(social, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

