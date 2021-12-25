//
//  MoviesDetailsCell.swift
//  ExellentPractial
//
//  Created by imobdev on 25/12/21.
//

import UIKit

class MoviesDetailsCell: UITableViewCell {

    @IBOutlet weak var lblDescripiton: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var TransparentBGView: UIView!
    @IBOutlet weak var imgLargePoster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
