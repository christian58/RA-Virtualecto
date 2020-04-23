//
//  MainTableViewCell.swift
//  RAVirtuaLect
//
//  Created by virtual lecto on 1/13/20.
//  Copyright © 2020 virtual lecto. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var ClCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MainTableViewCell
{
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate: D, forRow row:Int)
    {
        ClCollectionView.delegate = dataSourceDelegate
        ClCollectionView.dataSource = dataSourceDelegate
        
        ClCollectionView.reloadData()
    }
}
