// use it from root folder:
// `swift run --package-path xcfs build`

import Foundation
import FMake 

OutputLevel.default = .error

enum Config {
    static let iOSSystemVersion = "v3.0.6"
    static let iOSSystemRoot    = "https://github.com/holzschu"

    static var iOSSystemErrorHURL: String {
        "\(iOSSystemRoot)/ios_system/releases/download/\(iOSSystemVersion)/ios_error.h"
    }
}

try download(url: Config.iOSSystemErrorHURL)

// Catalyst slice enabled in this fork (WebSSH ships on macOS through Mac Catalyst).
let platforms: [Platform] = [.iPhoneOS, .iPhoneSimulator, .Catalyst]

let schemes = [ "network_ios" ]

var checksums: [[String]] = []

for scheme in schemes {
    try xcxcf(
        dirPath: ".build",
        project: "network_ios",
        scheme: scheme,
        platforms: platforms.map { ($0, excludedArchs: []) }
    )

    try cd(".build") {
        let zip = "\(scheme).xcframework.zip"
        try sh("zip --symlinks -r \(zip) \(scheme).xcframework")
        let chksum = try sha(path: zip)
        checksums.append([zip, chksum])
    }
}

var releaseNotes =
"""
Release notes:

\( checksums.markdown(headers: "File", "SHA 256") )

"""

try write(content: releaseNotes, atPath: ".build/release.md")

