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

// use app\blog\model\Introduce;
use app\blog\controller\Db;
use app\common\controller\BlogController;
class Introduce extends BlogController {

	/**
     * 模型对象
     */
    protected $model = null;

     /**
     * 初始化
     * User constructor.
     */

    public function __construct() {
        parent::__construct();
        // $this->model = model('introduce');
    }

    public function index() {
        
     
        return $this->fetch();
      
    }

    public function detail(){
        
    }

   
}