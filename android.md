# Android

## Ubuntu 18.04 LTS
### Install
```
sudo snap install android-studio --classic
```
* https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio#vm-linux

## Mac OS X
### Install
```
brew install ant
brew install maven
brew install gradle
brew cask install android-sdk
brew cask install android-ndk

brew cask install android-platform-tools
# adb devices
brew cask install android-studio
```
* Environment variables setup
  * Reference: https://gist.github.com/patrickhammond/4ddbe49a67e5eb1b9c03
```
export ANT_HOME=/usr/local/opt/ant
export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=/usr/local/opt/gradle
#export ANDROID_HOME=/usr/local/opt/android-sdk
#export ANDROID_NDK_HOME=/usr/local/opt/android-ndk
export ANDROID_HOME=/usr/local/share/android-sdk
export ANDROID_NDK_HOME=/usr/local/share/android-ndk

export PATH=$ANT_HOME/bin:$PATH
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/19.1.0:$PATH
```

### Maintain
* Update the SDK
```
brew update
android update sdk --no-ui
```

## References
* https://gist.github.com/agrcrobles/165ac477a9ee51198f4a870c723cd441
