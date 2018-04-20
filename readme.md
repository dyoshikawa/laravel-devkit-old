# Getting Started
```
git clone https://github.com/dyoshikawa/laravel-devkit
cd laravel-devkit
sh first-boot.sh
docker-compose up -d
```
Wait a moment... Show `localhost:3000`!

# Try Scaffold Command
```
docker-compose run app php artisan make:auth
docker-compose run app php artisan migrate
```
Wait a moment... Show `localhost:8000/home`!
