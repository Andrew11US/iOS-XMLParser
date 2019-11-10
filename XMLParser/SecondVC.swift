//
//  SecondVC.swift
//  XMLParser
//
//  Created by Andrew on 11/10/19.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit
import SwiftyXML

class SecondVC: UIViewController {
    
    @IBOutlet weak var textView2: UITextView!
    @IBOutlet weak var button: UIButton!
    
    let xmlString = """
    <catalog>
    <product description="Cardigan Sweater" product_image="cardigan.jpg" >
        <catalog_item gender="Men's" >
            <item_number>QWZ5671</item_number>
            <price>39.95</price>
            <size description="Medium" >
                <color_swatch image="red_cardigan.jpg" >Red</color_swatch>
                <color_swatch image="burgundy_cardigan.jpg" >Burgundy</color_swatch>
            </size>
            <size description="Large" >
                <color_swatch image="red_cardigan.jpg" >Red</color_swatch>
                <color_swatch image="burgundy_cardigan.jpg" >Burgundy</color_swatch>
            </size>
        </catalog_item>
        <catalog_item gender="Women's" >
            <item_number>RRX9856</item_number>
            <price>42.50</price>
            <size description="Small" >
                <color_swatch image="red_cardigan.jpg" >Red</color_swatch>
                <color_swatch image="navy_cardigan.jpg" >Navy</color_swatch>
                <color_swatch image="burgundy_cardigan.jpg" >Burgundy</color_swatch>
            </size>
        </catalog_item>
    </product>
    </catalog>

    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.layer.cornerRadius = 15.0
    }
    
    @IBAction func parseBtnTapped(_ sender: UIButton) {
        
        guard let path = Bundle.main.url(forResource: "Books", withExtension: ".xml") else { return }
        
        guard let xml = XML(url: path) else { return }

        let book = xml.book.author.stringValue
        print(book)
        
        var output = ""
        
        for book in xml.book {
            for title in book.title {
                print(title.string ?? "")
                output += "\(title.stringValue) \n"
            }
            for author in book.author {
                print(author.string ?? "")
                output += "\(author.stringValue) \n"
            }
        }
        
        self.textView2.text = output
    }
    
    
    
    
}
