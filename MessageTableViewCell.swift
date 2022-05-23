//
//  MessageTableViewCell.swift
//  Chat Demo
//
//  Created by Shien on 2022/5/20.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var headImageView: UIImageView!
    
    @IBOutlet weak var head2ImageView: UIImageView!
    @IBOutlet weak var message2TextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    
        // Configure the view for the selected state
    }
    
    
    
    func updateMan() {
        head2ImageView.layer.cornerRadius = head2ImageView.bounds.width/2
        message2TextView.layer.cornerRadius = 4
        message2TextView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        head2ImageView.image = UIImage(named: "man")
    }
    
    func updateDog(){
        headImageView.layer.cornerRadius = headImageView.bounds.width/2
        messageTextView.layer.cornerRadius = 4
        messageTextView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        headImageView.image = UIImage(named: "dog")
    }

}
