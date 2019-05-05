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
// use app\blog\service\ArticleService;


/**
 * 博客文章控制器
 * Class Artitle
 * @package app\blog\controller
 */
class Newlist extends BlogController {

	protected $model = null;

	public function __construct() {
        parent::__construct();
        $this->model = model('Article');
    }


    public function index() {
        
        $limit = 8;
        $total = db('blog_article')->count();
        $basic_data = model('Article')->order('update_at','desc')->field(['clicks,id,title,cover_img,update_at,`describe`'])->paginate($limit);
        // dump($basic_data);die;
        $this->assign('article_list',$basic_data);
        $this->assign('total',$total);

        // 分类新闻
        $cate_list = model('Category')->order('update_at', 'desc')->field(['id,title,update_at'])->paginate($limit,false,['query'=>request()->param()])->each(function($item,$key){

        	// 查询五条新闻的id和标题
        	$item['new_list'] = db('blog_article')->where(['category_id'=>$item['id']])->order('update_at','desc')->field('title,id,update_at')->limit(5)->select(); 
        	
        });
        $this->assign('cate_list',$cate_list);

        return $this->fetch();
    }

    public function new_last($id='') {
        
        if (!$this->request->isPost()) {
            //获取文章信息
            if (empty($id)) return msg_error('暂无新闻信息，请稍后再试','/newlist');

            $detail = $this->model->where(['status' => 0, 'is_deleted' => 0, 'id' => $id])->find();
            if (empty($detail)) return msg_error('暂无文章信息，请稍后再试','/newlist');

            //新增文章点击量
            $this->model->where(['id' => $id])->setInc('clicks', 1);

            $this->assign('detail',$detail);

            $limit = 5;
             // 分类新闻
	        $cate_list = model('Category')->order('update_at', 'desc')->field(['id,title,update_at'])->paginate($limit,false,['query'=>request()->param()])->each(function($item,$key){

	        	// 查询五条新闻的id和标题
	        	$item['new_list'] = db('blog_article')->where(['category_id'=>$item['id']])->order('update_at','desc')->field('title,id,update_at')->limit(5)->select(); 
	        	
	        });
	        $this->assign('cate_list',$cate_list);

            return $this->fetch();
        }
    }

    
}