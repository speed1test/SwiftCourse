//
//  MyCustomCollectionViewCell.swift
//  MyCustomCollection
//
//  Created by elsalvador on 18/1/25.
//

import UIKit

class MyCustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myLabel1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .lightGray
        myLabel1.textColor = .blue
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Tamaño fijo para cada celda
        let width = (collectionView.bounds.width - 30) / 2 // 2 celdas por fila con margen
        let height: CGFloat = 150 // Altura fija
        return CGSize(width: width, height: height)
    }
}
