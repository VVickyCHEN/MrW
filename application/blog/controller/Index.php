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

use app\blog\model\Article;
use app\blog\controller\Db;
use app\common\controller\BlogController;

class Index extends BlogController
{

    public function index()
    {
        $where['is_deleted']=0;
        $where['status']=0;
        $limit = 8;
  
        $basic_data = model('Casement')->order('create_at', 'desc')->field(['category_id,id,title,cover_img,create_at'])->where($where)->paginate($limit,false,['query'=>request()->param()])->each(function($item,$key){

        	$cat_id = $item['category_id'];
        	$item['category_name'] = db('Casecategory')->where(['id'=>$cat_id])->value('title');

        	$pro_id = $item['id'];
        	$exit_tag = db('blog_case_tag')->where(['case_id'=>$pro_id])->column('tag_id');
        	if(count($exit_tag)>0){
        		foreach ($exit_tag as $val) {
        			$tag_title[] = db('case_tag')->where(['id'=>$val])->value('tag_title');
        		}
        		$item['tag_title'] = $tag_title;
        	}else{
        		$item['tag_title'] = '';
        	}

        });
        $this->assign('casement_list',$basic_data);
        return $this->fetch();
    }
}