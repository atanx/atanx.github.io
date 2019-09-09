---
layout: post
title: PHP-laravel笔记
description: PHP-laravel笔记
category: 技术
---


## 新建Laravel项目

### 方式1
```
composer global require "laravel/installer"
```

```
laravel new blog
```

### 方式2

```
# blog是项目名
composer create-project laravel/laravel blog "5.1.*"
```

## 配置 

1. 修改.env文件

```
DB_HOST=localhost  
DB_DATABASE=homestead  
DB_USERNAME=pingce  
DB_PASSWORD=secret  
```
2. 数据库 `config/database.php`
```
'mysql' => [  
            'driver' => 'mysql',  
            'host' => 'localhost',  
            'port' => env('DB_PORT', '3306'),  
            'database' => 'pingce',,  
            'username' => 'homestead',  
            'password' => 'secret',  
            'charset' => 'utf8',  
            'collation' => 'utf8_unicode_ci',  
            'prefix' => '',  
            'strict' => false,  
            'engine' => null,  
        ],  
```



seeder
```php
php artisan make:migration create_settings_table --create=settings_t

php artisan migrate

php artisan make:seeder UsersTableSeeder

php artisan db:seed

php artisan make Model/

php artisan make:model Models/Order
```


3. session `config/session.php`
4. 缓存 `config/cache.php`

## 登录功能

### 路由中间件。

auth

新建app/Services/Registrar.php
在app/Providers/AppServiceProvider.php中绑定Registrar
```php
 public function register()
    {
        //
        $this->app->bind(
            'Illuminate\Contracts\Auth\Registrar',
            'App\Services\Registrar'
        ); 
    }
```


绑定全局函数helper.php


### 注册全局函数。
-   创建文件 app/helpers.php
-   在composer.json中添加auto_load

```js
"autoload": {
    "classmap": [
        "database"
    ],
    "psr-4": {
        "App\\": "app/"
    },
    "files": [
        "app/helpers/functions.php"
    ]
},
```

-  执行
```
composer dump-auto
```

## 修改加密方式

修改hasher
http://www.bcty365.com/content-153-5886-1.html

修改auth provider
http://www.bcty365.com/content-153-5884-1.html

