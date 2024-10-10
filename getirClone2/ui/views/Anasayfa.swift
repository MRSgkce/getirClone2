//
//  ViewController.swift
//  getirClone2
//
//  Created by Mürşide Gökçe on 10.10.2024.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var urunlerCollectionView: UICollectionView!
    
    var urunlerListesi = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        urunlerCollectionView.delegate = self
        urunlerCollectionView.dataSource = self
        
        let f1 = Urunler(id: 1,  resim: "django")
        let f2 = Urunler(id: 2,  resim: "inception")
        
        urunlerListesi.append(f1)
        urunlerListesi.append(f2)
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        let ekrangenislik = UIScreen.main.bounds.width
        let itemWidth = (ekrangenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemWidth, height: itemWidth*1.5)
        urunlerCollectionView.collectionViewLayout = tasarim
        
    }


}

extension Anasayfa: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let urun = urunlerListesi[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "urunlerHucre", for: indexPath) as! UrunlerHucre
        
        cell.imageUrun.image = UIImage(named: urun.resim!)

        
        cell.layer.borderColor=UIColor.lightGray.cgColor
        cell.layer.borderWidth=0.3
        cell.layer.cornerRadius=10
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    
}
