# koel

Instructions:
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

References:
1. https://www.howtoforge.com/how-to-install-koel-music-streaming-server-using-docker-on-rocky-linux-8/  
2. https://github.com/koel/docker/blob/master/docker-compose.postgres.yml  
3. https://www.geeksforgeeks.org/how-to-build-and-release-flutter-application-in-android-device/  
4. https://flutteragency.com/how-to-build-flutter-app-in-release-mode-for-ios/  
5. https://github.com/koel/player  
