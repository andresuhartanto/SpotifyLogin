// Copyright (c) 2017 Spotify AB.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit

internal class SpotifyLoginButton: UIButton {

    weak var viewController: UIViewController?
    var scopes: [Scope]?

    override public init(frame: CGRect) {
        super.init(frame: frame)
        applyLayout()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyLayout()
    }

    func applyLayout() {
        self.backgroundColor = UIColor.spt_green()
        self.setTitleColor(.white, for: .normal)
        self.tintColor = .white
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 0.0)
        self.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 8.0)
        self.adjustsImageWhenHighlighted = false
        self.setImage(UIImage(named: "spotifylogo-32.png",
                              in: Bundle(for: SpotifyLoginButton.self),
                              compatibleWith: nil)!
            .withRenderingMode(.alwaysTemplate), for: .normal)
        self.setTitle("SIGN IN WITH SPOTIFY", for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        self.frame.size = self.intrinsicContentSize
    }

    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = self.isHighlighted ? UIColor.spt_darkGreen() : UIColor.spt_green()
        }
    }

    public override var intrinsicContentSize: CGSize {
        return CGSize(width: 260.0, height: 55.0)
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height/2
    }

}

internal extension UIColor {

    class func spt_green() -> UIColor {
        return UIColor(red: 29.0/255.0, green: 185.0/255.0, blue: 84.0/255.0, alpha: 1.0)
    }

    class func spt_darkGreen() -> UIColor {
        return UIColor(red: 29.0/255.0, green: 167.0/255.0, blue: 77.0/255.0, alpha: 1.0)
    }

}
