import UIKit

extension NSAttributedString {
    public static func attributedString(fromImage image: UIImage, fontCapHeight: CGFloat) -> NSAttributedString {
        let textAttachment = NSTextAttachment()
        textAttachment.bounds = CGRect(x: 0.0, y: (fontCapHeight - image.size.height) / 2.0, width: image.size.width, height: image.size.height)
        textAttachment.image = image
        
        return NSAttributedString(attachment: textAttachment)
    }
}
