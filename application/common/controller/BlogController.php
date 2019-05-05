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

namespace app\common\controller;


use app\common\service\AuthService;
use app\common\service\QiniuService;
use think\Controller;
use think\Db;
use think\facade\Cache;

/**
 * 前端博客基础控制器
 * Class BlogController
 * @package app\common\controller
 */
class BlogController extends Controller {

    /**
     * 网站标题
     * @var string
     */
    protected $title = '';

    /**
     * 是否开启登录检测
     * @var bool
     */
    protected $is_login = false;

    /**
     * 是否启用七牛云上传图片
     * @var bool
     */
    protected $is_qiniu = false;

    /**
     * 会员信息
     * @var array
     */
    protected $member = [];

    /**
     * 博客配置信息
     * @var array
     */
    protected $BlogInfo = [];

    /**
     * 后台配置信息
     * @var array
     */
    protected $SysInfo = [];

    protected $website_link = [];// 友情链接

    protected $product_list = [];//footer的产品

    protected $keyword = [];//关键字和描述

    /**
     * 构造函数
     * BlogController constructor.
     */
    public function __construct() {
        parent::__construct();

        // 友情链接
        $this->keyword = Cache::get('keyword');
        if(empty($this->keyword)){
            Db::table('keyword')->cache('keyword',600)->select();
            $this->keyword = Cache::get('keyword');
            $this->assign('keyword',$this->keyword);
        }else{
            $this->assign('keyword',$this->keyword);
        }
    
        // 友情链接
        $this->website_link = Cache::get('website_link');
        if(empty($this->website_link)){
            Db::table('blog_website_link')->cache('website_link',600)->select();
            $this->website_link = Cache::get('website_link');
            $this->assign('website_link',$this->website_link);
        }else{

            $this->assign('website_link',$this->website_link);
        }

        //footer的产品
        $this->product_list = Cache::get('product_list');
        if(empty($this->product_list)){
            Db::table('blog_product')->cache('product_list',600)->select();
            $this->product_list = Cache::get('product_list');
            // echo '我是刚缓存';die;
            $this->assign('product_list',$this->product_list);
        }else{
            $this->assign('product_list',$this->product_list);
        }

        //前台公共配置管理
        $this->config_list = Cache::get('config_list');
        if(empty($this->config_list)){
            Db::table('blog_config')->where('id','in',[40,41,42,43,44])->cache('config_list',600)->select();

            $this->config_list = Cache::get('config_list');
            $this->assign('config_list',$this->config_list);
        }else{
            $this->assign('config_list',$this->config_list);
        }

        $ScanFollow = Db::table('blog_config')->where('id','in',[36])->value('value');
        $this->assign('ScanFollow',$ScanFollow);
       
    }

    /**
     * 判断会员是否已登录
     */
    public function checkLogin() {
        if (empty(session('member.id'))) {
            return $this->redirect('@blog');
        }
    }

    /**
     * 检测登录是否过期
     * @param $member
     */
    public function checkLoginOver($member) {
        (isset($this->BlogInfo['LoginDuration']) && !empty($this->BlogInfo['LoginDuration'])) ? $LoginDuration = $this->BlogInfo['LoginDuration'] : $LoginDuration = '';
        if (!empty($LoginDuration) && isset($member['login_at'])) {
            if (time() - $member['login_at'] >= $LoginDuration) {
                //记录退出登录日志
                $this->LoginRecord(3);
                //清空会员数据缓存
                $this->member = [];
                session(null);
            }
        }
    }

    /**
     * 初始化七牛云
     */
    public function iniQiniu() {
        $this->assign(['qiniu_token' => QiniuService::getToken()]);
    }

    /**
     * 记录登录日志
     * @param int $type （0：主动退出登录，1：账户登录，2：QQ快捷登录,3：过期退出登录）
     */
    public function LoginRecord($type = 1) {
        switch ($type) {
            case 0:
                $type = 0;
                $remark = '【主动退出】正在退出博客系统！';
                break;
            case 1:
                $type = 1;
                $remark = '【账户登录】正在进入博客系统！';
                break;
            case 2:
                $type = 1;
                $remark = '【QQ快捷】正在进入博客系统！';
                break;
            case 3:
                $type = 0;
                $remark = '【登录过期】正在退出博客系统！';
                break;
            default:
                $type = '3';
                $remark = '【未知】';
        }
        $location_info = get_location();
        if (!empty(session('member.id'))) {
            Db::name('BlogLoginRecord')->insert([
                'type'      => $type,
                'member_id' => session('member.id'),
                'ip'        => get_ip(),
                'country'   => $location_info['country'],
                'region'    => $location_info['region'],
                'city'      => $location_info['city'],
                'isp'       => $location_info['isp'],
                'location'  => $location_info['country'] . $location_info['region'] . $location_info['city'] . $location_info['isp'],
                'remark'    => $remark,
            ]);
        }
    }
}