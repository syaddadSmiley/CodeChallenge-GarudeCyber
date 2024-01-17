<?php
namespace App\Models;

use CodeIgniter\Model;

class RewardsModel extends Model
{
    protected $table = 'rewards';
    protected $primaryKey = 'id';
    protected $allowedFields = [
        'tenant_id',
        'name',
        'description',
        'point',
        'created_at'
    ];
    protected $useTimestamps = true;
    protected $dateFormat = 'datetime';
    protected $returnType = 'array';

    public function getRewards($id = false)
    {
        if ($id == false) {
            return $this->findAll();
        }

        return $this->where(['id' => $id])->first();
    }
}
