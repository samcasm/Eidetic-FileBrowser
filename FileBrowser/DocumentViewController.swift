//
//  DocumentViewController.swift
//  FileBrowser
//
//  Created by user145467 on 11/6/18.
//  Copyright © 2018 user145467. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {
    
    @IBOutlet weak var documentNameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    var document: Document?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
                
                if self.document?.fileType == "public.png" || self.document?.fileType == "public.jpeg" {
                  
                    self.imageView.image = UIImage(data: (self.document?.fileData)!)
           
                }
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }
    
    
    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
}
