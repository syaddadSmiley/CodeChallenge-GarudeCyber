<?php

namespace App\Models;

use CodeIgniter\Model;

class VoucherModel extends Model
{
    protected $table = 'vouchers';

    protected $fillable = [
        'code',
        'discount',
        'expiry_date',
    ];

    // Add your custom methods and relationships here
}
