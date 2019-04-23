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
        
        $limit = 3;
        $total = db('blog_article')->count();
        $basic_data = model('Article')->order('update_at','desc')->field(['clicks,id,title,cover_img,update_at,`describe`'])->paginate($limit);
        // dump($basic_data);die;
        $this->assign('article_list',$basic_data);
        $this->assign('total',$total);

        // 分类新闻
        $basic_data = model('blog_category')->order('update_at', 'desc')->field(['category_id,id,title,cover_img,update_at'])->where($where)->paginate($limit,false,['query'=>request()->param()])->each(function($item,$key){

        	$cat_id = $item['category_id'];
        	$item['category_name'] = db('Procategory')->where(['id'=>$cat_id])->value('title');

        	$pro_id = $item['id'];
        	$exit_tag = db('blog_product_tag')->where(['Product_id'=>$pro_id])->column('tag_id');
        	if(count($exit_tag)>1){
        		foreach ($exit_tag as $val) {
        			$tag_title[] = db('Product_tag')->where(['id'=>$val])->value('tag_title');
        		}
        		$item['tag_title'] = $tag_title;
        	}else{
        		$item['tag_title'] = '';
        	}

        });


        return $this->fetch();
    }

    public function new_last() {
        
        if (!$this->request->isPost()) {
            $id = $this->request->param('id');
            //获取文章信息
            if (empty($id)) return msg_error('暂无新闻信息，请稍后再试');

            $detail = $this->model->where(['status' => 0, 'is_deleted' => 0, 'id' => $id])->find();
            if (empty($detail)) return msg_error('暂无文章信息，请稍后再试');

            //新增文章点击量
            $this->model->where(['id' => $id])->setInc('clicks', 1);

            $this->assign('detail',$detail);
            return $this->fetch();
        }
    }

    
}