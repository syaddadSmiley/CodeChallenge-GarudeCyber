<?php

namespace App\Models;

use CodeIgniter\Model;

class RewardRedemptionModel extends Model
{
    protected $table = 'rewards_redemptions';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'user_id',
        'reward_id',
        'created_at'
    ];

    public function getRewardRedemptions($id = false)
    {
        if ($id == false) {
            return $this->findAll();
        }

        return $this->where(['id' => $id])->first();
    }
}

