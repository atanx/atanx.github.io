---
layout: post
title: PHP-操作文件和目录
description: PHP-操作文件和目录
category: 技术
---
[toc]

[toc]

# 上传文件

```php
function upload_image()
{
    $tmp = $_FILES['file']['tmp_name'];
    $name = $_FILES['file']['name'];
    $image_path = $_POST['image_path'];
    //die($name);
    if(move_uploaded_file($tmp,$image_path)){
        echo "上传成功";
    }else{
        echo "上传失败";
    }
}

function upload_chatroom_image()
{
    $tmp = $_FILES['file']['tmp_name'];
    $name = $_FILES['file']['name'];
    $image_path = $_POST['image_path'];
    $folder = $_POST['image_folder'];
    if(!is_dir($folder)){
        mkdir($folder);
    }
    if(move_uploaded_file($tmp,$image_path)){
        echo "上传成功";
    }else{
        echo "上传失败";
    }
}
```

## 创建目录
```php
    $folder = $_POST['image_folder'];
    if(!is_dir($folder)){
        mkdir($folder);
    }
```