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
cd /opt
sudo mkdir android-sdk && cd android-sdk
sudo wget https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip
sudo unzip commandlinetools-linux-6200805_latest.zip
sudo ./tools/bin/sdkmanager --sdk_root=$(pwd) "build-tools;28.0.3" "emulator" "platform-tools" "platforms;android-28" "tools"

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
