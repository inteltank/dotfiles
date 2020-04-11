echo "Mac defaults setting Start" 
echo "done install" 
echo "###############################################################################"
echo "General UI/UX"
echo "###############################################################################"

echo "----------------------------------------------------------------------------"
echo "setting Dock"
echo "----------------------------------------------------------------------------"
# Automatically hide or show the Dock （Dock を自動的に隠す）
defaults write com.apple.dock autohide -bool true
# Wipe all app icons from the Dock （Dock に標準で入っている全てのアプリを消す、Finder とごみ箱は消えない）
defaults write com.apple.dock persistent-apps -array
# Set the icon size （アイコンサイズの設定）
defaults write com.apple.dock tilesize -int 55
# Magnificate the Dock （Dock の拡大機能を入にする）
# defaults write com.apple.dock magnification -bool true


echo "----------------------------------------------------------------------------"
echo "setting"
echo "----------------------------------------------------------------------------" 
# Set highlight color to green
defaults write NSGlobalDomain AppleHighlightColor -string "Orange"

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "###############################################################################"
echo "# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #"
echo "###############################################################################"

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# set pointer speed to max
defaults -currentHost write -g com.apple.trackpad.scaling 4

# 3本指dragの設定
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1

echo "###############################################################################"
echo "Screen"
echo "###############################################################################"

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

echo "###############################################################################"
echo "# Finder                                                                      #"
echo "###############################################################################"
# Set `${HOME}` as the default location for new Finder windows
# 新しいウィンドウでデフォルトでホームフォルダを開く
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show Status bar in Finder （ステータスバーを表示）
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder （パスバーを表示）
defaults write com.apple.finder ShowPathbar -bool true

# Show Tab bar in Finder （タブバーを表示）
defaults write com.apple.finder ShowTabView -bool true

# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
chflags nohidden ~/Library

# Show the hidden files （不可視ファイルを表示）
defaults write com.apple.finder AppleShowAllFiles YES

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Show the /Volumes folder
sudo chflags nohidden /Volumes

echo "###############################################################################"
echo "# Dock, Dashboard, and hot corners                                            #"
echo "###############################################################################"

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock orientation left


# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

echo "###############################################################################"
echo "# Login window"
echo "###############################################################################"
# Show shut down etc. buttons
defaults write /Library/Preferences/com.apple.loginwindow PowerOffDisabled -bool false

# Don't show any password hints
defaults write /Library/Preferences/com.apple.loginwindow RetriesUntilHint -int 0

# Allow fast user switching
defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool true

# ファイルなどを印刷する際に表示されるダイアログのデフォルト設定を、詳細表示に変更します。※
defaults write -g PMPrintingExpandedStateForPrint -bool true
# ダウンロードしたファイルを、初めて開く際に表示される警告ダイアログ。これを表示されないようにします。
defaults write com.apple.LaunchServices LSQuarantine -bool false
# 以下を実行し再ログインすると、アプリが以上終了した際に表示される「クラッシュリポーター」が無効になります。
defaults write com.apple.CrashReporter DialogType none

# Dockを画面下に表示してる場合は左端に。横に表示してる場合は上端に移動します。
defaults write com.apple.dock pinning -string start

# Dockにウィンドウをしまうときのエフェクトは、通常「スケールエフェクト」と「ジニーエフェクト」しか選べません。以下を実行すると隠しエフェクトの「Suck」が有効になります。
defaults write com.apple.dock mineffect suck
