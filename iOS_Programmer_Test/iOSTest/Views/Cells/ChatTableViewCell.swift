//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Created by D & A Technologies on 1/22/18.
//  Copyright © 2018 D & A Technologies. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var bodyView: UIView!
    
    let borderWidth: CGFloat = 1
    static let nibName = "ChatTableViewCell"

    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        bodyView.layer.cornerRadius = 8
        body.sizeToFit()
        body.numberOfLines = 0
    }
    
    // MARK: - Public
    func setCellData(message: MessageModel) {
        header.text = message.name
        body.text = message.message
        fotoPerfil(url: message.avatar_url!)
    }
    
    func fotoPerfil(url: String) {
        do {
            let url = URL(string: url)
            let data = try Data(contentsOf: url!)
            UIView.transition(with: self.userImage,
                              duration: 0.75,
                              options: UIView.AnimationOptions.transitionCrossDissolve,
                              animations: { self.userImage.image = UIImage(data: data) },
                              completion: nil)
            userImage.layer.cornerRadius = userImage.frame.width / 2
            userImage.clipsToBounds = true
        }
        catch{
            print(error)
        }
    }
}
