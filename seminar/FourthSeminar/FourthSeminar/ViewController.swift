//
//  ViewController.swift
//  FourthSeminar
//
//  Created by SHIN YOON AH on 2021/05/08.
//

import UIKit

struct PersonDataModel: Encodable {
    var name: String
    var age: Int
}

class ViewController: UIViewController {
    
    let personData = PersonDataModel(name: "철수", age: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try jsonEncoder.encode(personData)
            print(String(data: data, encoding: .utf8)!)
        } catch {
            print(error)
        }
    }


}

