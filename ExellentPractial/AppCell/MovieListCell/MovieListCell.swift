//
//  MovieListCell.swift
//  ExellentPractial
//
//  Created by imobdev on 25/12/21.
//

import UIKit

class MovieListCell: UITableViewCell {

    @IBOutlet weak var lblDescripiton: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgVIew: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
