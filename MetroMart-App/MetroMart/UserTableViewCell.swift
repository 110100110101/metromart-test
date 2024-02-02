//
//  UserTableViewCell.swift
//  MetroMart-App
//
//  Created by Jaja Yting on 2/2/24.
//

import UIKit
import SnapKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    
    private var viewMain: UIView!
    private var stackViewData: UIStackView!
    private var imageViewAvatar: UIImageView!
    private var labelUsername: UILabel!
    private var labelProfileLink: UILabel!
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initializeSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.initializeSubViews()
    }
    
    func setData(_ user: User) {
        
        self.labelUsername.text = user.username
        self.imageViewAvatar.kf.setImage(with: user.avatar)
        self.labelProfileLink.text = user.profile.absoluteString
    }
    
    private func initializeSubViews() {
        
        self.viewMain = UIView()
        self.contentView.addSubview(self.viewMain)
        self.viewMain.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8.0)
        }
        
        self.imageViewAvatar = UIImageView()
        self.viewMain.addSubview(self.imageViewAvatar)
        self.imageViewAvatar.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.width.equalTo(32.0)
        }
        
        self.stackViewData = UIStackView()
        self.stackViewData.axis = .vertical
        self.viewMain.addSubview(self.stackViewData)
        self.stackViewData.snp.makeConstraints { make in
            make.left.equalTo(self.viewMain.snp.right).inset(4.0)
            make.right.equalToSuperview().inset(4.0)
            make.centerY.equalToSuperview()
        }
        
        self.labelUsername = UILabel()
        self.stackViewData.addArrangedSubview(self.labelUsername)
        
        self.labelProfileLink = UILabel()
        self.labelProfileLink.textColor = .gray
        self.stackViewData.addArrangedSubview(self.labelProfileLink)
    }
}
