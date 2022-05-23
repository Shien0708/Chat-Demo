//
//  ChattingTableViewCell.swift
//  Chat Demo
//
//  Created by Shien on 2022/5/20.
//

import UIKit

class ChattingTableViewCell: UITableViewCell {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var bubbleTextView: UITextView!
    
    @IBOutlet weak var bubble2TextView: UITextView!
    @IBOutlet weak var head2ImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateDog(){
        headImageView.layer.cornerRadius = headImageView.bounds.width/2
        bubbleTextView.layer.cornerRadius = 4
        bubbleTextView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        headImageView.image = UIImage(named: "dog")
    }
    func updateMan(){
        head2ImageView.layer.cornerRadius = head2ImageView.bounds.width/2
        bubble2TextView.layer.cornerRadius = 4
        bubble2TextView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        head2ImageView.image = UIImage(named: "man")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
