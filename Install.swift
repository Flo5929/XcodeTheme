import Foundation
import Files // marathon:https://github.com/JohnSundell/Files.git
import ShellOut // marathon:https://github.com/JohnSundell/ShellOut.git

let fontsFolder = try Folder.home.subfolder(atPath: "Library/Fonts")

if !fontsFolder.containsFile(named: "FiraCode-Regular.ttf") {
    print("🅰️  Downloading Fira Code font...")

    let fontZipURL = URL(string: "https://github.com/tonsky/FiraCode/releases/download/1.205/FiraCode_1.205.zip")!
    let fontZipData = try Data(contentsOf: fontZipURL)

    print("🅰️  Installing Fira Code font...")

    let fontZipFile = try fontsFolder.createFile(named: "FiraCode.zip", contents: fontZipData)
    try shellOut(to: "unzip \(fontZipFile.name) -d FiraCode", at: fontsFolder.path)

    let firaCodeFolder = try fontsFolder.subfolder(named: "FiraCode")
    let ttfFolder = try firaCodeFolder.subfolder(named: "TTF")
    try ttfFolder.files.move(to: fontsFolder)

    try firaCodeFolder.delete()
    try fontZipFile.delete()
}

print("🎨  Downloading Xcode theme...")

let themeURL = URL(string: "https://raw.githubusercontent.com/jlnquere/XcodeTheme/master/SundellsFiraColors.xccolortheme")!
let themeData = try Data(contentsOf: themeURL)

print("🎨  Installing Xcode theme...")

let xcodeFolder = try Folder.home.subfolder(atPath: "Library/Developer/Xcode")
let userDataFolder = try xcodeFolder.createSubfolderIfNeeded(withName: "UserData")
let themeFolder = try userDataFolder.createSubfolderIfNeeded(withName: "FontAndColorThemes")

let themeFile = try themeFolder.createFile(named: "SundellsFiraColors.xccolortheme")
try themeFile.write(data: themeData)

print("")
print("🎉 Sundell's Fira Colors successfully installed")
print("👍 Select it in Xcode's preferences to start using it (you may have to restart Xcode first)")
