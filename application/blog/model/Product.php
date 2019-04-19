<?php

// +----------------------------------------------------------------------
// | Think.Admin
// +----------------------------------------------------------------------
// | 版权所有 2014~2017 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://think.ctolog.com
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zoujingli/Think.Admin
// +----------------------------------------------------------------------

namespace app\blog\model;

use app\common\service\AuthService;
use app\common\service\ModelService;

/**
 * 博客文章模型
 * Class Product
 * @package app\blog\model
 */
class Product extends ModelService {

    /**
     * 绑定数据表
     * @var string
     */
    protected $table = 'blog_product';

    /**
     * 关联会员表
     * @return \think\model\relation\HasOne
     */
    public function memberInfo() {
        return $this->hasOne("Member", "id", "member_id")->joinType('left')->field('nickname, username');
    }

    /**
     * 关联文章类型
     * @return \think\model\relation\HasOne
     */
    public function categoryInfo() {
        return $this->hasOne("Category", "id", "category_id")->joinType('left')->field('title, image');
    }

    /**
     * 根据分类查询文章
     * @param $category_id
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function getproductCategoryList($category_id, $page = 15) {
        $where_product_list = [
            'status'     => 0,
            'is_deleted' => 0,
        ];
        if ($category_id != 0) {
            $where_product_list['category_id'] = $category_id;
        }
        $product_list = $this->where($where_product_list)->order('create_at', 'desc')->paginate($page, false, ['query' => ['category_id' => $category_id]])
            ->each(function ($item, $key) {
                $item->memberInfo;
                $item->categoryInfo;
                $where_product_list[] = ['product_id', '=', $item['id']];
                $item['comment_total'] = model('Comment')->where($where_product_list)->count();
            });
        return $product_list;
    }

    /**
     * 获取单个会员的所有文章信息
     * @param     $member_id
     * @param int $page
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public function getMemberproductList($member_id, $page = 10) {
        $where_product_list = [
            ['member_id', '=', $member_id],
            ['status', '=', 0],
            ['is_deleted', '=', 0],
        ];
        $product_list = $this->where($where_product_list)->order('create_at', 'desc')->paginate($page, false, ['query' => ['member_id' => $member_id]])
            ->each(function ($item, $key) {
                $item->memberInfo;
                $item->categoryInfo;
                $where_product_list[] = ['product_id', '=', $item['id']];
                $item['comment_total'] = model('Comment')->where($where_product_list)->count();
                $item['category_title'] = model('Category')->where(['id' => $item['category_id']])->value('title');
            });
        return $product_list;
    }

    /**
     * 获取最新的文章
     * @param int $limit 显示数量
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getNewestProductList($limit = 15) {
        $where_product_list = [
            ['status', '=', 0],
            ['is_deleted', '=', 0],
        ];
        $product_list = $this->where($where_product_list)->limit($limit)->order('create_at', 'desc')->field(['category_id,id,cover_img,create_at'])->select()
            ->each(function ($item, $key) {
                $cate_id[] = ['id', '=', $item['category_id']];
                $item['category_name'] = model('Procategory')->where($cate_id)->value('title');
            });
        return $product_list;
    }

    /**
     * 文章点击排行榜
     * @param int $limit 显示数量
     * @return array|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getClickRankingList($limit = 10) {
        $where_click_ranking_list = [
            ['status', '=', 0],
            ['is_deleted', '=', 0],
        ];
        $order_click_ranking_list = [
            'clicks'    => 'desc',
            'create_at' => 'asc',
        ];
        $click_ranking_list = $this->field('id , title, clicks')
            ->where($where_click_ranking_list)
            ->order($order_click_ranking_list)
            ->limit($limit)
            ->select();
        return $click_ranking_list;
    }

    /**
     * 获取推荐阅读的文章
     * @param int $limit
     */
    public function getRecommendList($limit = 5) {
        $where_recommend_list = [
            ['status', '=', 0],
            ['is_deleted', '=', 0],
        ];
        $order_recommend_list = [
            'recommend' => 'desc',
            'create_at' => 'asc',
        ];
        $recommend_list = $this->field('id , title, clicks')
            ->where($where_recommend_list)
            ->order($order_recommend_list)
            ->limit($limit)
            ->select();
        return $recommend_list;
    }

    /**
     * 获取上一篇文章
     * @param $id 文章编号
     * @return array|null|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getLastproduct($id) {
        $where_last_product = [
            ['status', '=', 0],
            ['is_deleted', '=', 0],
            ['id', '<', $id],
        ];
        $last_product = $this->where($where_last_product)
            ->order('id', 'desc')
            ->find();
        return $last_product;
    }

    /**
     * 获取下一篇文章
     * @param $id 文章编号
     * @return array|null|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getNextproduct($id) {
        $where_next_product = [
            ['status', '=', 0],
            ['is_deleted', '=', 0],
            ['id', '>', $id],
        ];
        $next_product = $this->where($where_next_product)
            ->order('id', 'asc')
            ->find();
        return $next_product;
    }

    /**
     * 新增文章
     * @param $insert
     * @return \think\response\Json
     * @throws \think\exception\PDOException
     */
    public function add($insert) {
        //使用事物保存数据
        $this->startTrans();
        $save = $this->save($insert);
        $product_id = $this->id;
        if (!$save) {
            $this->rollback();
            return __error('数据有误，请稍后再试！');
        }
        $this->commit();
        $this->__buildAddTag($product_id, $insert);
        return __success('文章添加成功！');
    }

    /**
     * 修改文章
     * @param $update
     * @return \think\response\Json
     * @throws \think\exception\PDOException
     */
    public function edit($update) {
        $update_product = $update;
        unset($update_product['product_id']);
        unset($update_product['tag_list']);
        $this->where(['id' => $update['product_id']])->update($update_product);
        model('productTag')->where(['product_id' => $update['product_id']])->delete();
        $this->__buildAddTag($update['product_id'], $update);
        return __success('文章修改成功！');
    }

    /**
     * 前置数据
     * @param $data
     */
    protected function __buildAddTag($product_id, $insert) {
        if (isset($insert['tag_list']) && !empty($insert['tag_list']) && !empty($product_id)) {
            list($tag_list, $save_all) = [explode(',', $insert['tag_list']), []];
            foreach ($tag_list as $vo) {
                $tag_id = model('Tag')->where(['tag_title' => $vo])->value('id');
                if (empty($tag_id)) {
                    $tag_id = model('Tag')->insertGetId(['tag_title' => $vo]);
                }
                $save_all[] = [
                    'product_id' => $product_id,
                    'tag_id'     => $tag_id,
                ];
            }
            model('productTag')->saveAll($save_all);
        }
    }

    /**
     * 搜索结果
     * @param     $word
     * @param int $limit
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function searchproduct($word, $category_id, $page = 10) {
        $where_product_list = [
            ['title', 'LIKE', "%{$word}%"],
            ['status', '=', 0],
            ['is_deleted', '=', 0],
        ];
        $query = [
            'word' => $word,
        ];
        if (!empty($category_id)) {
            $where_product_list[] = ['category_id', '=', $category_id];
            $query['category_id'] = $category_id;
        }
        $product_count = $this->where($where_product_list)->count();
        $product_list = $this->where($where_product_list)->order('create_at', 'desc')->paginate($page, false, ['query' => $query])
            ->each(function ($item, $key) {
                $item->memberInfo;
                $item->categoryInfo;
                $where_product_list[] = ['product_id', '=', $item['id']];
                $item['comment_total'] = model('Comment')->where($where_product_list)->count();
            });
        foreach ($product_list as &$vo) $vo['title'] = $this->replaceTitle($word, $vo['title']);
        return ['count' => $product_count, 'list' => $product_list];
    }

    /**
     * 替换字体颜色
     * @param $word
     * @param $title
     * @return mixed
     */
    protected function replaceTitle($word, $title) {
        $format_word = "<span style='color:red'>{$word}</span>";
        $title = str_replace($word, $format_word, $title);
        return $title;
    }
}