<?php

namespace App\Controllers;

use App\Models\UserModel;
use App\Models\VoucherModel;
use App\Models\RewardsModel;
use App\Models\RewardRedemptionModel;

class RedeemController extends BaseController
{
    public function index(): string
    {   
        $data['vouchers'] = (new \App\Models\VoucherModel())->findAll();
        $data['tenants'] = (new \App\Models\TenantModel())->findAll();
        $data['user'] = (new \App\Models\UserModel())->find(session()->get('user')['id']);

        return view('NavbarView', $data).view('RedeemView', $data);
    }

    public function redeemVoucher()
    {
        $userModel = new UserModel();
        $voucherModel = new VoucherModel();
        $rewardsModel = new RewardsModel();
        $rewardsRedemptionModel = new RewardRedemptionModel();

        $user = $userModel->where('id', session()->get('user')['id'])->first();
        $voucher = $voucherModel->where('voucher_code', $this->request->getPost('voucher-code'))->first();

        if (!$voucher) {
            $data['vouchers'] = (new \App\Models\VoucherModel())->findAll();
            $data['tenants'] = (new \App\Models\TenantModel())->findAll();
            $data['user'] = (new \App\Models\UserModel())->find(session()->get('user')['id']);
            $data['error'] = ['error' => 'Voucher not found'];
            return view('NavbarView').view('RedeemView', $data);
        }

        if($rewardsRedemptionModel->where('user_id', $user['id'])->where('reward_id', $voucher['tenant_id'])->first()){
            $data['vouchers'] = (new \App\Models\VoucherModel())->findAll();
            $data['tenants'] = (new \App\Models\TenantModel())->findAll();
            $data['user'] = (new \App\Models\UserModel())->find(session()->get('user')['id']);
            $data['error'] = ['error' => 'Voucher already redeemed'];
            return view('NavbarView').view('RedeemView', $data);
        }

        if ($voucher['expired_at'] < date('Y-m-d')) {
            return redirect()->to('/redeem');
        }else if($voucher['tenant_id'] != $this->request->getPost('tenant-option')){
            echo $this->request->getPost('tenant-option');
            $data['vouchers'] = (new \App\Models\VoucherModel())->findAll();
            $data['tenants'] = (new \App\Models\TenantModel())->findAll();
            $data['user'] = (new \App\Models\UserModel())->find(session()->get('user')['id']);
            $data['error'] = ['error' => 'Voucher not found'];
            return view('NavbarView').view('RedeemView', $data);
        }

        $rewards = $rewardsModel->where('id', $voucher['tenant_id'])->first();
        if (!$rewards) {
            return redirect()->to('/redeem');
        }

        $userModel->update($user['id'], ['points' => $user['points'] + $rewards['point']]);
        $rewardsRedemptionModel->insert([
            'user_id' => $user['id'],
            'reward_id' => $rewards['id'],
            'created_at' => date('Y-m-d H:i:s')
        ]);

        $data['vouchers'] = (new \App\Models\VoucherModel())->findAll();
        $data['tenants'] = (new \App\Models\TenantModel())->findAll();
        $data['user'] = (new \App\Models\UserModel())->find(session()->get('user')['id']);
        $data['success'] = ['success' => 'Voucher redeemed successfully'];
        return view('NavbarView').view('RedeemView', $data);
    }
}
