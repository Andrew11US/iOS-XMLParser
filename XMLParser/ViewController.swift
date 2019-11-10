//
//  ViewController.swift
//  XMLParser
//
//  Created by Andrew on 11/10/19.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    var books: [Book] = []
    var elementName: String = String()
    var bookTitle = String()
    var bookAuthor = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.url(forResource: "Books", withExtension: ".xml") {
            if  let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
        
        var tempStr = ""
        for book in books {
            
//            tempStr += book.bookTitle
//            tempStr += book.bookAuthor
            
            tempStr += """
            
            \(book.bookAuthor)
            
            \(book.bookTitle)

            """
            
            print(book.bookAuthor)
            print(book.bookTitle)
        }
        textView.text = tempStr
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "book" {
            bookTitle = String()
            bookAuthor = String()
        }
        
        self.elementName = elementName
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "book" {
            let book = Book(bookAuthor: bookAuthor, bookTitle: bookTitle)
            books.append(book)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if self.elementName == "title" {
                bookTitle += data
            } else if self.elementName == "author" {
                bookAuthor += data
            }
        }
    }

}

