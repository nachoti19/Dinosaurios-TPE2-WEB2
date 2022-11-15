<?php
require_once './app/model/dinosaurios.model.php';
require_once './app/view/api.view.php';
require_once './app/helper/auth-api.helper.php';
require_once './app/model/auth-api.model.php';

function base64url_encode($data) {
    return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
}


class AuthApiController{
    private $view;
    private $authHelper;
    private $apiModel;

    private $data;

    public function __construct()
    {
        $this->view = new Apiview();
        $this->authHelper = new AuthApiHelper();
        $this->data = file_get_contents("php://input");
        $this->apiModel = new AuthApiModel();
    }

    private function getData(){
        return json_decode($this->data);
    }

    public function getToken($params = null){
        $basic = $this->authHelper->getAuthHeader();
        if(empty($basic)){
            $this->view->response('No autorizado', 401);
            return;
        }else{
        $basic = explode(" ",$basic);
        if($basic[0]!="Basic"){
            $this->view->response('La autenticación debe ser Basic', 401);
            return;
        }
        }
        $userpass = base64_decode($basic[1]);
        $userpass = explode(":", $userpass);
        $user = $userpass[0];
        $pass = $userpass[1];
        if($this->apiModel->validateUserPassword($user, $pass)){
            $header = array(
                'alg' => 'HS256',
                'typ' => 'JWT'
            );
            $payload = array(
                'id' => 1,
                'name' => "$user",
                'exp' => time()+3600
            );
            $header = base64url_encode(json_encode($header)); //SE PASA EL HEADER A JSON
            $payload = base64url_encode(json_encode($payload)); //SE PASA EL PAYLOAD A JSON
            $signature = hash_hmac('SHA256', "$header.$payload", "supersecret", true); //SE CREA LA FIRMA
            $signature = base64url_encode($signature); //SE CODIFICA LA FIRMA
            $token = "$header.$payload.$signature"; //SE CREA EL TOKEN CON TODO LO ANTERIOR

            $this->view->response($token, 200);
        }
        else{
            $this->view->response('Unauthorized', 401);
        }


    }

}