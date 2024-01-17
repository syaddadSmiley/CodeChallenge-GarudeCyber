<?php

namespace App\Controllers;

use App\Models\UserModel;

class LoginController extends BaseController
{
    public function index()
    {
        return view('NavbarView').view('LoginView');
    }

    public function login()
    {
        $userModel = new UserModel();

        $user = $userModel->where('email', $this->request->getPost('email'))->first();

        if (!$user) {
            return redirect()->to('/login');
        }

        if (!password_verify($this->request->getPost('password'), $user['password'])) {
            return redirect()->to('/login');
        }

        session()->set('user', $user);

        return redirect()->to('/redeem');
    }
}
