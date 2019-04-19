<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/11
 * Time: 1:43
 */

namespace app\admin\validate\blog;

use think\Validate;

/**
 * 产品验证器
 * Class Product
 * @package app\admin\validate\blog
 */
class Product extends Validate {

    /**
     * 验证规则
     * @var array
     */
    protected $rule = [
        'id'          => 'require|number|checkArticleId',
        'product_id'  => 'require|number|checkArticleId',
        'member_id'   => 'require|number',
        'tag_list'    => 'require',
        'content'     => 'require',
        'title'       => 'require|max:250',
        'category_id' => 'require|number',
        'cover_img'   => 'require|max:250',
        'describe'    => 'max:250',
    ];

    /**
     * 错误提示
     * @var array
     */
    protected $message = [
        'product_id.require'  => '产品编号必须',
        'product_id.number'   => '产品编号应该为数字',
        'member_id.require'   => '请先登录后再进行操作',
        'member_id.number'    => '人员编号应该为数字',
        'content.require'     => '产品内容必须',
        'tag_list.require'    => '产品标签必须',
        'content.max'         => '产品内容最多不能超过20000个字符',
        'title.require'       => '产品标题必须',
        'title.max'           => '产品标题最多不能超过250个字符',
        'category_id.require' => '产品分类必须',
        'category_id.number'  => '产品分类必须为数字',
        'cover_img.require'   => '产品LOGO必须',
        'cover_img.max'       => '产品LOGO最多不能超过250个字符',
        'describe.max'        => '产品描述最多不能超过250个字符',
    ];

    /**
     * 应用场景
     * @var array
     */
    protected $scene = [
        'add_comment' => ['product_id', 'member_id', 'content'],
        'del'         => ['id'],
        'status'         => ['id'],
    ];

    /**
     * 新增产品
     * @return Article
     */
    public function sceneAdd() {
        return $this->only(['member_id', 'title', 'tag_list', 'category_id', 'cover_img', 'describe', 'content'])
            ->append('content', 'max:10000000');
    }

    /**
     * 修改产品
     * @return Article
     */
    public function sceneEdit() {
        return $this->only(['product_id', 'title', 'tag_list', 'category_id', 'cover_img', 'describe', 'content'])
            ->append('content', 'max:10000000');
    }

    /**
     * 检测产品是否存在
     * @param       $value
     * @param       $rule
     * @param array $data
     * @return bool|string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    protected function checkArticleId($value, $rule, $data = []) {
        $where = [
            ['id', '=', $value],
            ['is_deleted', '=', 0],
        ];
        $product = \app\admin\model\blog\Product::where($where)->find();
        if (empty($product)) return '暂无此产品！';
        return true;
    }

    /**
     * 检测内容
     * @param       $value
     * @param       $rule
     * @param array $data
     * @return bool|string
     */
    public function checkContent($value, $rule, $data = []) {
        if (empty($value) || $value = '<p><br></p>') return '内容不能为空！';
        return true;
    }
}