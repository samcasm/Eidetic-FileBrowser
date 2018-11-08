//
//  Document.swift
//  FileBrowser
//
//  Created by user145467 on 11/6/18.
//  Copyright © 2018 user145467. All rights reserved.
//

import UIKit

class Document: UIDocument {
    
    var fileData: Data?
    
    override func contents(forType typeName: String) throws -> Any {
        // Encode your document with an instance of NSData or NSFileWrapper
        return Data()
    }
    
    override func load(fromContents contents: Any, ofType typeName: String?) throws {
        // Load your document from contents
        
        if let fileType = typeName {
            
            // #4.2 - I only support .PNG and .JPG type image files.
            if fileType == "public.png" || fileType == "public.jpeg" || fileType == "public.jpg"  { 
                
                // #4.3 - If reading was successful, store
                // the binary data into the document model.
                if let fileContents = contents as? Data {
                    
                    fileData = fileContents
                    
                }
                
                // #4.4 - If reading from a text file...
            }
        }
    }
}

