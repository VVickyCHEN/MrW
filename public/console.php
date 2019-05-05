<?php

namespace think;

/**
 * 后台地址入口
 */
// 加载基础文件
require __DIR__ . '/../thinkphp/base.php';

//判断应用是否已安装
if (file_exists('../config/lock/install.lock') == false) {
    header("location:./install.php");
    exit;
}

// 执行应用并响应
Container::get('app')->bind('admin')->run()->send();
