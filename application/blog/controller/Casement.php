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

use app\blog\controller\Db;
use app\common\controller\BlogController;
// use app\blog\service\caseService;


/**
 * 博客文章控制器
 * Class Artitle
 * @package app\blog\controller
 */
class Casement extends BlogController {

    protected $model = null;

    public function __construct() {
        parent::__construct();
        $this->model = model('Casement');
    }


    public function index() {
        $casecategory = $this->request->param('casecategory');
        $limit = 8;
        
        $order = [
            'sort'      => 'asc',
            'update_at' => 'desc',
        ];
        
        $cate_list = db('casecategory')->order($order)->field(['id,title,sort,update_at'])->select();
        $this->assign('cate_list',$cate_list);


        // 当前案例
        if(!empty($casecategory)){
            $this->assign('casecategory',$casecategory);
            $total = db('blog_case')->where(['category_id'=>$casecategory])->count();
            $now_case_list = model('Casement')->order('update_at','desc')->field(['clicks,id,title,cover_img,update_at,`describe`'])->where(['category_id'=>$casecategory])->paginate($limit);

            $this->assign('case_list',$now_case_list);
            $this->assign('total',$total);

        }else{

            $total = db('blog_case')->where(['category_id'=>$cate_list['0']['id']])->count();

            $now_case_list = model('Casement')->order('update_at','desc')->field(['clicks,id,title,cover_img,update_at,`describe`'])->where(['category_id'=>$cate_list['0']['id']])->paginate($limit);

            $this->assign('case_list',$now_case_list);
            $this->assign('total',$total);
            $this->assign('casecategory',$cate_list['0']['id']);

        }



        return $this->fetch();
    }

    public function detail() {
        
        if (!$this->request->isPost()) {
            $id = $this->request->param('case_id');
            //获取文章信息
            if (empty($id)) return msg_error('暂无案例信息，请稍后再试','/blog/newlist');

            $detail = $this->model->where(['status' => 0, 'is_deleted' => 0, 'id' => $id])->field('title,describe,content')->find();
            if (empty($detail)) return msg_error('暂无案例信息，请稍后再试','/blog/newlist');

            //新增文章点击量
            $this->model->where(['id' => $id])->setInc('clicks', 1);

            $this->assign('detail',$detail);

            $order = [
                'sort'      => 'asc',
                'update_at' => 'desc',
            ];

            $cate_list = db('casecategory')->order($order)->field(['id,title,sort,update_at'])->select();
            $this->assign('cate_list',$cate_list);

            return $this->fetch();
        }
    }

    
}