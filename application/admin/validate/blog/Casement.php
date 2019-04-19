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
 * 案例验证器
 * Class case
 * @package app\admin\validate\blog
 */
class Casement extends Validate {

    /**
     * 验证规则
     * @var array
     */
    protected $rule = [
        'id'          => 'require|number|checkArticleId',
        'case_id'  => 'require|number|checkArticleId',
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
        'case_id.require'  => '案例编号必须',
        'case_id.number'   => '案例编号应该为数字',
        'member_id.require'   => '请先登录后再进行操作',
        'member_id.number'    => '人员编号应该为数字',
        'content.require'     => '案例内容必须',
        'tag_list.require'    => '案例标签必须',
        'content.max'         => '案例内容最多不能超过20000个字符',
        'title.require'       => '案例标题必须',
        'title.max'           => '案例标题最多不能超过250个字符',
        'category_id.require' => '案例分类必须',
        'category_id.number'  => '案例分类必须为数字',
        'cover_img.require'   => '案例LOGO必须',
        'cover_img.max'       => '案例LOGO最多不能超过250个字符',
        'describe.max'        => '案例描述最多不能超过250个字符',
    ];

    /**
     * 应用场景
     * @var array
     */
    protected $scene = [
        'add_comment' => ['case_id', 'member_id', 'content'],
        'del'         => ['id'],
        'status'         => ['id'],
    ];

    /**
     * 新增案例
     * @return Article
     */
    public function sceneAdd() {
        return $this->only(['member_id', 'title', 'tag_list', 'category_id', 'cover_img', 'describe', 'content'])
            ->append('content', 'max:10000000');
    }

    /**
     * 修改案例
     * @return Article
     */
    public function sceneEdit() {
        return $this->only(['case_id', 'title', 'tag_list', 'category_id', 'cover_img', 'describe', 'content'])
            ->append('content', 'max:10000000');
    }

    /**
     * 检测案例是否存在
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
        $ifcase = \app\admin\model\blog\casement::where($where)->find();
        if (empty($ifcase)) return '暂无此案例！';
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