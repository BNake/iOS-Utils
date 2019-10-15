//
//  OTPLabel.swift
//  Utils
//
//  Created by Anton Dryakhlykh on 15.10.2019.
//  Copyright © 2019 Surf. All rights reserved.
//

final class OTPLabel: UILabel {

    // MARK: - Nested

    enum State {
        case active
        case inactive
        case error
    }

    // MARK: - Constants

    private enum Constants {
        static let fontSize: CGFloat = 24.0
        static let size: CGFloat = 32.0
        static let bottomHeight: CGFloat = 1.0
        static let bottomLineTopPadding: CGFloat = 16.0
    }

    // MARK: - Private Properties

    private let bottomLineView = UIView()
    private var state = State.inactive
    private var activeTextColor = UIColor.blue
    private var inactiveTextColor = UIColor.black
    private var errorTextColor = UIColor.red
    private var activeBottomLineColor = UIColor.blue
    private var inactiveBottomLineColor = UIColor.black
    private var errorBottomLineColor = UIColor.red

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    // MARK: - Public Methods

    func configure(for state: State) {
        switch state {
        case .active:
            textColor = activeTextColor
            bottomLineView.backgroundColor = activeBottomLineColor
        case .inactive:
            textColor = inactiveTextColor
            bottomLineView.backgroundColor = inactiveBottomLineColor
        case .error:
            textColor = errorTextColor
            bottomLineView.backgroundColor = errorBottomLineColor
        }

        self.state = state
    }

    func set(font: UIFont) {
        self.font = font
    }

    func setActive(textColor: UIColor, bottomLineColor: UIColor) {
        activeTextColor = textColor
        activeBottomLineColor = bottomLineColor
    }

    func setInactive(textColor: UIColor, bottomLineColor: UIColor) {
        inactiveTextColor = textColor
        inactiveBottomLineColor = bottomLineColor
    }

    func setError(textColor: UIColor, bottomLineColor: UIColor) {
        errorTextColor = textColor
        errorBottomLineColor = bottomLineColor
    }

    // MARK: - Private Methods

    private func configure() {
        addBottomLine()
        textColor = inactiveTextColor
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Constants.size),
            widthAnchor.constraint(equalToConstant: Constants.size)
        ])
    }

    private func addBottomLine() {
        bottomLineView.backgroundColor = inactiveBottomLineColor
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomLineView)
        NSLayoutConstraint.activate([
            bottomLineView.heightAnchor.constraint(equalToConstant: Constants.bottomHeight),
            bottomLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLineView.topAnchor.constraint(equalTo: bottomAnchor,
                                                constant: Constants.bottomLineTopPadding)
        ])
    }
}
