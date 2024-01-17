<?php
namespace App\Controllers;

use App\Models\UserModel;

class RegisterController extends BaseController
{
    public function index()
    {
        return view('NavbarView').view('RegisterView');
    }

    public function register()
    {
        $userModel = new UserModel();

        $user = $userModel->where('email', $this->request->getPost('email'))->first();
        if ($user) {
            return view('NavbarView').view('RegisterView');
        }
        
        $userModel->insert([
            'name' => $this->request->getPost('name'),
            'email' => $this->request->getPost('email'),
            'password' => password_hash($this->request->getPost('password'), PASSWORD_DEFAULT),
        ]);

        return view('NavbarView').view('LoginView');
    }
}

