//
//  FavoriteCell.swift
//  FavoritesManager
//
//  Created by Аяулым Куат on 29.11.2025.
//

import UIKit

class FavoriteCell: UITableViewCell {
    static let reuseIdentifier = "FavoriteCell"

    let thumbImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        return iv
    }()

    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        lbl.numberOfLines = 2
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(thumbImageView)
        contentView.addSubview(titleLabel)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.addSubview(thumbImageView)
        contentView.addSubview(titleLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            thumbImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            thumbImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            thumbImageView.widthAnchor.constraint(equalToConstant: 60),
            thumbImageView.heightAnchor.constraint(equalToConstant: 60),

            titleLabel.leadingAnchor.constraint(equalTo: thumbImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        if let img = UIImage(named: item.imageName) {
            thumbImageView.image = img
            thumbImageView.tintColor = nil
        } else {
            thumbImageView.image = UIImage(systemName: item.imageName)
            thumbImageView.tintColor = .systemBlue
        }
    }
}
