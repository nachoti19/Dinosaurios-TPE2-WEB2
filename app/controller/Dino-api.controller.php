<?php

require_once './app/model/dinosaurios.model.php';
require_once './app/view/api.view.php';
require_once './app/helper/auth-api.helper.php';

class DinoApiController{
    private $model;
    private $view;
    private $data;
    private $authHelper;
    public function __construct(){
        $this->model = new DinosModel();
        $this->view = new APIview();
        $this->authHelper = new AuthApiHelper();
        $this->data = file_get_contents("php://input");
    }

    private function getData() {
        return json_decode($this->data);
    }



    public function getDinos($params = null){
        $attributes = $this->model->getAttributes();
        $attributesFilter = [];

        foreach($attributes as $attribute){
            if(isset($_GET[$attribute])){
                $attributesFilter[$attribute] = ($_GET[$attribute]);
            }
        }

        if(isset($_GET['sortby'])) $sortby = $_GET['sortby'];
        else $sortby = null;
        if (isset($_GET['order'])) $order = $_GET['order'];
        else $order = null;
        if (isset($_GET['page'])) $page = intval($_GET['page']);
        else $page = null;
        if (isset($_GET['limit'])) $limit = intval($_GET['limit']);
        else $limit = null;

        $dinos = $this->model->getDinos($attributes, $attributesFilter, $sortby, $order, $page, $limit);
        $this->view->response($dinos, 200);
    }

    public function getDino($params = null){
        $id = $params[':ID'];
        $dino = $this->model->selectDinoEdit($id);
        if($dino){
            $this->view->response($dino, 200);
        }
        else{
            $this->view->response('La tarea con el id=$id no existe', 404);
        }
    }

    public function DeleteDino($params = null){
        if (!$this->authHelper->isLoggedIn()) {

            $this->view->response("Unauthorized", 401);
            return;

        }
        $id = $params[':ID'];
        $dino = $this->model->selectDinoEdit($id);
        if($dino){
            $this->model->DeleteDinos($id);
            $this->view->response("el dinosaurio $dino->nombre_cientifico se elimino correctamente", 200);
        }
        else{
            $this->view->response("el dinosaurio con la id $id no existe", 400);
        }
    }

    public function InsertarDino($params = null){
        if (!$this->authHelper->isLoggedIn()) {

            $this->view->response("Unauthorized", 401);
            return;

        }

        $dino = $this->getData();

        if(empty($dino->nombre_cientifico)||empty($dino->altura)||empty($dino->peso)||empty($dino->alimentacion)||empty($dino->anios_vivos)||empty($dino->id_habitat_fk)||empty($dino->descripcion)){
            $this->view->response("Complete los datos", 400);
        }
        else{
            $id = $this->model->insertarDino($dino->nombre_cientifico, $dino->altura, $dino->peso, $dino->alimentacion, $dino->anios_vivos, $dino->id_habitat_fk, $dino->descripcion);
            $dino = $this->model->selectDinoEdit($id);
            $this->view->response("el dinosaurio $dino->nombre_cientifico se creo correctamente", 201);

        }
    }

    public function EditarDino($params = null){
        if (!$this->authHelper->isLoggedIn()) {

            $this->view->response("Unauthorized", 401);
            return;

        }
        $dino_id = $params[':ID'];
        $dino = $this->getData();
        if(empty($dino->nombre_cientifico)||empty($dino->altura)||empty($dino->peso)||empty($dino->alimentacion)||empty($dino->anios_vivos)||empty($dino->id_habitat_fk)||empty($dino->descripcion)){
            $this->view->response("Datos vacios", 400);
        }
        else{
            $this->model->actualizarDinos($dino->nombre_cientifico, $dino->altura, $dino->peso, $dino->alimentacion, $dino->anios_vivos, $dino->id_habitat_fk, $dino->descripcion, $dino_id);
            $this->view->response("Dinosaurio con la id:$dino_id actualizado", 200);
        }
    }

}