//
//  MainContentView.swift
//  TheImage
//
//  Created by Nikita Kuzmin on 21.11.2024.
//

import UIKit

final class MainContentView: UIView {
    private enum Constants {
        static let imageViewHeight: CGFloat = 270
    }
    
    // MARK: - Properties
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "cat"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var containerView: UIView = {
        let view = UIView(frame: .init(x: .zero, y: .zero, width: bounds.width, height: Constants.imageViewHeight))
        return view
    }()
    
    private(set) lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.contentInsetAdjustmentBehavior = .never
        view.frame = bounds
        view.delegate = self
        return view
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        makeConstraints()
        setContentSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension MainContentView {
    func setContentSize() {
        scrollView.contentSize = CGSize(width: frame.width, height: frame.height * 2)
    }
    
    func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(imageView)
    }
    
    func makeConstraints() {
        let imageViewTopConstraint = imageView.topAnchor.constraint(equalTo: topAnchor)
        let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: Constants.imageViewHeight)
        imageViewTopConstraint.priority = .defaultHigh
        heightConstraint.priority = .defaultLow

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            imageViewTopConstraint,
            heightConstraint
        ])
    }
}

extension MainContentView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.scrollIndicatorInsets = UIEdgeInsets(
            top: imageView.bounds.height - safeAreaInsets.top + 15,
            left: .zero,
            bottom: .zero,
            right: .zero
        )
    }
}
