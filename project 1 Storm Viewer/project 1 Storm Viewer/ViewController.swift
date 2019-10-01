//
//  ViewController.swift
//  project 1 Storm Viewer
//
//  Created by NGUYENLONGTIEN on 9/30/19.
//  Copyright © 2019 NGUYENLONGTIEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var pictures = [String]()
    @IBOutlet weak var myTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        myTable.dataSource = self
        myTable.delegate = self
        //declare constant called fm to look for file
        let fm = FileManager.default
        //declare constant called path to tell me where I can find all images I added to app
        let path = Bundle.main.resourcePath
        do{
            let items = try fm.contentsOfDirectory(atPath: path!)
            for item in items {
                if item.hasPrefix("nssl"){
                    pictures.append(item)
                }
            }
        }catch{
            
        }
        
       print(pictures)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = pictures[indexPath.row]
        
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        // tao storyboard
        let sb = UIStoryboard(name: "Main", bundle: nil)
        // tao mang hinh moi
        let detailScreen = sb.instantiateViewController(identifier: "detail") as! DetailViewController
        detailScreen.selectedImage = pictures[indexPath.row]
        // navigation
        self.navigationController?.pushViewController(detailScreen, animated: true)
    }
}

