//
//  DecodeViewController.swift
//  FourthSeminar
//
//  Created by SHIN YOON AH on 2021/05/08.
//

import UIKit



struct CoffeeDataModel : Decodable {
    var drink : String
    var price : Int
    var orderer : String
    
    enum CodingKeys : String, CodingKey{
        case drink
        case price = "coffee_price"
        case orderer
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        drink = (try? values.decode(String.self, forKey: .drink)) ?? ""
        price = (try? values.decode(Int.self, forKey: .price)) ?? 0
        orderer = (try? values.decode(String.self, forKey: .orderer)) ?? ""
    }
}

class DecodeViewController: UIViewController {
    
    let dummyData = """
        {
          "drink" : "아메리카노",
          "coffee_price" : 3000
        }
    """.data(using: .utf8)!
    
    override func viewDidLoad() {

        super.viewDidLoad()

        let jsonDecoder = JSONDecoder()
        do
        {
            let order = try jsonDecoder.decode(CoffeeDataModel.self, from: dummyData)
            print("디코더 성공")
            // 클래스 구조체를 더 상세하게 나옴
            // 자세하게 출력하고 싶으면 print말고 dump사용해보기
            dump(order)
            print(order.price)
        }
        catch
        {
            print(error)
        }
    }
}
