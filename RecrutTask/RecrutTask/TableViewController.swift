//
//  TableViewController.swift
//  RecrutTask
//
//  Created by Magnis-2 on 7/8/19.
//  Copyright © 2019 Magnis-2. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    
    
    @IBOutlet weak var phoneNumberInfo: UILabel!
    @IBOutlet weak var studyPlaceInfo: UILabel!
    @IBOutlet weak var bornPlaceInfo: UILabel!
    @IBOutlet weak var bornDateInfo: UILabel!
    @IBOutlet weak var livePlaceInfo: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var biographyInfo: UITextView!
    


    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        mainImage.layer.cornerRadius = mainImage.frame.height/2
        
        DispatchQueue.main.async{
            self.loadImage()
            
        }
        }
    override func viewDidAppear(_ animated: Bool) {
         self.loadData()
        
    }
    
    func loadImage(){
        let defaults = UserDefaults.standard
        var imgData = defaults.object(forKey: "saveImg") as? Data
        if imgData != nil{
            mainImage.image = UIImage(data: imgData!)
        } else{
            
            if let url = URL(string:"https://i.pinimg.com/originals/43/f9/07/43f90790a622f7af320e254686f6243f.jpg"){
                if let data=try? Data(contentsOf:url){
                    self.mainImage.image=UIImage(data: data)
                    
                    let imgData = self.mainImage.image!.pngData()
                    let defaults = UserDefaults.standard
                    defaults.set (imgData, forKey : "savedImg")
                }
            }
        }
    }
    
    func loadData(){
        
        let file = "filetxt"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            do{
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                
                var data = text.components(separatedBy: .newlines)
                livePlaceInfo.text = data[0]
                bornDateInfo.text = data[1]
                bornPlaceInfo.text = data[2]
                studyPlaceInfo.text = data[3]
                phoneNumberInfo.text = data[4]
                biographyInfo.text = data[5] + "\n"
            }
            catch{
                bornDateInfo.text = String()
                bornPlaceInfo.text = String()
                studyPlaceInfo.text=String()
                phoneNumberInfo.text=String()
                biographyInfo.text=String()
            }
        }
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }

}
