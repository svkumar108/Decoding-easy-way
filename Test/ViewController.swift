//
//  ViewController.swift
//  Test
//
//  Created by sivakumar on 06/12/18.
//  Copyright © 2018 sivakumar. All rights reserved.
//

import UIKit

struct siva: Decodable{
    let feed:Titles
}

struct Titles:Decodable{
    let title:String
    let results:[Results]
}

struct Results:Decodable{
    let name:String
    let artistName:String
}





class ViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getData()
        
        
       
    }
    
    func getData(){
        
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/in/ios-apps/top-free/all/10/explicit.json") else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            guard let data = data else{return}
            
            do{
              
                let mydata = try JSONDecoder().decode(siva.self, from: data)
                
                
               let resultArray = mydata.feed.results
                
                for names in resultArray{
                    
                    print(names.name)
                    print(names.artistName)
                }
                
                
               
                
            
                
            }catch{
                print("errorrrrr")
            }
           
          
}.resume()

}
    
   
}


