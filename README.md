# koel

## Instructions:
```
docker run -it --rm phanan/koel bash
touch .env; echo 'APP_KEY=' >> .env
php artisan key:generate --force
cat .env
# Copy the whole APP_KEY string
exit
cd ~/projects/koel
mkdir music
cp koel.env .env
# Replace the APP_KEY string with a new one, save and exit

# Initialize Koel
docker exec --user www-data -it koel bash
php artisan koel:init --no-assets
## follow along the instructions
exit

# Default Administrator credentials
email: admin@koel.dev
password: KoelIsCool

# Test the web interface
curl localhost:8080
```

## Build the Koel mobile player
### Android

#### Pre-requisite
0. Install Android SDK:
sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt update
sudo apt install android-studio -y
# flutter config --android-sdk="$ANDROID_HOME/cmdline-tools"
flutter doctor

1. Clone the repository: `git clone https://github.com/koel/player`
2. Go to root and run: `flutter build appbundle` or `flutter build apk --split-per-abi`
3. Install an APK on a device: `flutter install`

### iOS
1. Clone the repository: `git clone https://github.com/koel/player`
2. Go to root and run: `flutter build ios`
3. You need a Mac to continue building the iOS binary
4. Follow the next steps in Reference #4

## References:
1. https://www.howtoforge.com/how-to-install-koel-music-streaming-server-using-docker-on-rocky-linux-8/  
2. https://github.com/koel/docker/blob/master/docker-compose.postgres.yml  
3. https://www.geeksforgeeks.org/how-to-build-and-release-flutter-application-in-android-device/  
4. https://flutteragency.com/how-to-build-flutter-app-in-release-mode-for-ios/  
5. https://github.com/koel/player  
6. https://stackoverflow.com/questions/49175231/flutter-does-not-find-android-sdk
7. https://developer.android.com/tools/releases/platform-tools
8. https://developer.android.com/studio
9. https://medium.com/@barcelos.ds/install-android-sdk-in-the-ubuntu-20-04-lts-without-android-studio-1b629924d6c5