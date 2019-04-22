<?php
// +----------------------------------------------------------------------
// | 99PHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018~2020 https://www.99php.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Mr.Chung <chung@99php.cn >
// +----------------------------------------------------------------------

namespace app\blog\controller;


use app\common\controller\BlogController;
// use app\blog\service\ArticleService;


/**
 * 博客文章控制器
 * Class Artitle
 * @package app\blog\controller
 */
class Newlist extends BlogController {

    public function index() {
        
        return $this->fetch();
    }

    public function new_last() {
        
        return $this->fetch();
    }

    
}