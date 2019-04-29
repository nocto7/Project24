import UIKit

let name = "Taylor"

for letter in name {
    print("Give me a \(letter)!")
}

let letter = name[name.index(name.startIndex, offsetBy: 3)]

// this is bad! don't do it!
extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

let letter2 = name[3]

let password = "123456"
password.hasPrefix("123")
password.hasSuffix("456")

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
}

password.deletingPrefix("123")
password.deletingSuffix("456")

let weather = "It's going to rain"
print(weather.capitalized)

extension String {
    var capitalisedFirst: String {
        guard let firstLetter = self.first else { return ""}
        return firstLetter.uppercased() + self.dropFirst()
    }
}

print(weather.capitalisedFirst)

let input = "Swift is like Objective-C without the C"
input.contains("Swift")

let languages = ["Python", "Ruby", "Swift"]
languages.contains("Swift")
languages.contains(where: input.contains)

let string = "This is a test string"
let attributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.purple,
    .font: UIFont.boldSystemFont(ofSize: 36)
]
let attributedString = NSAttributedString(string: string, attributes: attributes)
let attributedString2 = NSMutableAttributedString(string: string)
attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))
attributedString2.addAttribute(.underlineStyle, value: NSUnderlineStyle.double, range: NSRange(location: 15, length: 6))

let string3 = "This is a new test string"
let attributes3: [NSAttributedString.Key: Any] = [
    .underlineStyle: NSUnderlineStyle.double.rawValue
]
let attributedString3 = NSAttributedString(string: string3, attributes: attributes3)
let attributes4: [NSAttributedString.Key: Any] = [
    .strikethroughStyle: NSUnderlineStyle.single.rawValue
]
let attributedString4 = NSAttributedString(string: string, attributes: attributes4)

let paragraphStyle = NSMutableParagraphStyle()
paragraphStyle.alignment = .right
let attributes5: [NSAttributedString.Key: Any] = [
    .paragraphStyle: paragraphStyle
]
let attributedString5 = NSAttributedString(string: string, attributes: attributes5)
let attributes6: [NSAttributedString.Key: Any] = [
    .link: URL(string: "https://www.apple.com/") as Any
]
let attributedString6 = NSAttributedString(string: string, attributes: attributes6)

extension String {
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return prefix + self
    }
}

"pet".withPrefix("car")
"carpet".withPrefix("car")

extension String {
    func isNumber() -> Bool {
        if Double(self) != nil { return true }
        return false
    }
}

"123".isNumber()
"carpet".isNumber()
"12.34".isNumber()

extension String {
    var lines: [String] {
        return self.components(separatedBy: "\n")
    }
}

"this\nis\na\ntest".lines

let emilyDickinson = """
There's a certain Slant of light,
Winter Afternoons –
That oppresses, like the Heft
Of Cathedral Tunes –

Heavenly Hurt, it gives us –
We can find no scar,
But internal difference –
Where the Meanings, are –

None may teach it – Any –
'Tis the seal Despair –
An imperial affliction
Sent us of the Air –

When it comes, the Landscape listens –
Shadows – hold their breath –
When it goes, 'tis like the Distance
On the look of Death –
"""

emilyDickinson.lines

extension UIView {
    func bounceOut(duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            [weak self] in
            self?.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        }
    }
}

let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
view1.backgroundColor = .red
let view2 = UIView(frame: CGRect(x:0, y: 0, width: 100, height: 100))
view2.backgroundColor = .cyan
view1.addSubview(view2)


// can't seem to get playground to show the animation :(
view2.bounceOut(duration: 5)
view1

extension Int {
    func times(_ thingToDo: () -> Void) {
        if self < 1 { return }
        for _ in 1...self {
            thingToDo()
        }
    }
}

5.times {
    print("Hello!")
}

let num = -5
num.times {
    print("Goodbye!")
}

extension Array where Element: Comparable {
    mutating func remove(item: Element) {
        if let firstIndex = self.firstIndex(of: item) {
            self.remove(at: firstIndex)
        }
    }
}

var duran = ["Simon", "John", "Nick", "Andy", "Roger"]
duran.remove(item: "John")
var duran_surnames = ["Le Bon", "Taylor", "Rhodes", "Taylor", "Taylor"]
duran_surnames.remove(item: "Taylor")

