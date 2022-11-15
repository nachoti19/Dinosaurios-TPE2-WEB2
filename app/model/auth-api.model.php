<?php
class AuthApiModel{
    private $db;
    public function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=dinosaurios;charset=utf8', 'root', '');
    }
    public function validateUserPassword($user, $pass){
        $query = $this->db->prepare("select * from usuarios where email = ?");
        $query->execute([$user]);
        $userpassword = $query->fetch(PDO::FETCH_OBJ);
        if(!$userpassword){
            return false;
        }
        if(($userpassword->email == $user) && password_verify($pass, $userpassword->password)){
            return true;
        }
        else{
            return false;
        }
    }
}