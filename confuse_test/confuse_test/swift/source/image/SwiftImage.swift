//
//  SwiftImage.swift
//  confuse_test
//
//  Created by yjs on 2021/6/21.
//  Copyright © 2021 coding520. All rights reserved.
//

import UIKit

class SwiftImage: UIViewController, SwiftBaseProtocol, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var dataSource = [SwiftImageModel]()
    @IBOutlet var image1: UIImageView!
    @IBOutlet var imageMiddle: UIImageView!
    @IBOutlet var imageBottom: UIImageView!

    override func viewDidAppear(_ animated: Bool) {
        test()
    }

    func test() {
        _ = UIImage(named: "error")
        _ = UIImage(named: "my_fox")
        _ = UIImage(named: "timg-21")
        let label = UILabel()
        label.text = "swift"
        let btn = UIButton()
        btn.setTitle("swift", for: .normal)
        _ = UIImage(named: "timg-\(3)")
        _ = UIImage(named: "oc")
        _ = UIImage(named: "lua")
        _ = UIImage(named: "swift")

        for i in 1 ... 3 {
            _ = UIImage(named: String(format: "number%lu", UInt(i)))
        }
        Bundle.main.path(forResource: "锤石", ofType: "png")
        let imagePath = Bundle.main.path(forResource: "锤石.png", ofType: nil)
        imageMiddle.image = UIImage(contentsOfFile: imagePath ?? "")
        imageBottom.image = UIImage(contentsOfFile: Bundle.main.path(forResource: "Lee Sin", ofType: "jpg") ?? "")
        let data = [
            "timg": "我疯了?呵,很有可能",
            "zhongguo": "中国",
            "dangjianhuodong": "党",
            "bayijianjunjie": "八一",
            "yjs.png": "discard file png",
            "discard_lajitong": "discard.xcassets",
            "Lee Sin.jpg": "image file",
        ]
        for (k, v) in data {
            let model = SwiftImageModel()
            model.image = k
            model.title = v
            dataSource.append(model)
        }
        tableView.reloadData()
    }
}

extension SwiftImage {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftImageCell", for: indexPath)
        let model = dataSource[indexPath.row]
        cell.imageView?.image = UIImage(named: model.image)
        cell.textLabel?.text = model.title
        return cell
    }
}
