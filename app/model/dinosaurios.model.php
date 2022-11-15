<?php

class DinosModel{
    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=dinosaurios;charset=utf8', 'root', '');
    }

    public function getAttributes(){
        $query = $this->db->prepare("SHOW COLUMNS FROM `dinos`");
        $query->execute();
        $attributes = $query->fetchAll(PDO::FETCH_OBJ);

        $arrayAttributes[0] = "";
        
        foreach ($attributes as $key => $attribute){
            $arrayAttributes[$key+1] = strtolower($attribute->Field);
        }
        return $arrayAttributes;

    }

    //DINOSAURIOS
    //conseguir dinos y insertarlos en la db
    public function getDinos($attributes, $attributesFilter, $sortby, $order, $page, $limit){
        $sql = "SELECT * FROM dinos";

        $sqlfilter = "";
        $filterValues = [];
        foreach ($attributesFilter as $key=>$attribute){
            if(!empty($attribute)){
                $sqlfilter .= "$key LIKE ? AND ";
                $filterValues[] = "$attribute";
            }
        }
        if (!empty($sqlfilter)){
            $sql .= " WHERE " . rtrim($sqlfilter, " AND");
        }
        if (!empty($sortby)){
            if(array_search($sortby, $attributes) != false){
                $sql .= " ORDER BY $sortby";
            }
        }else{
            $sql .= " ORDER BY id_dinosaurio";
        }
        if(!empty($order)){
            if ($order == "desc"){
                $sql .= " DESC";
            }else{
                if ($order == "asc"){
                    $sql .= " ASC";
                }
            }
        }
        if (!empty($page) && is_numeric($page) && $page > 0 && !empty($limit) && is_numeric($limit) && $limit > 0){
            $pos = $limit * ($page - 1);
            $sql .= " LIMIT $pos, $limit";
        }
        $query = $this->db->prepare($sql);

        if(!empty($filterValues)){
            $query->execute($filterValues);
        }else{
            $query->execute();
        }
        $dinos = $query->fetchAll(PDO::FETCH_OBJ);
        return $dinos;
    }

    function getDinoHab($id){
        $query = $this->db->prepare("SELECT * from dinos WHERE id_habitat_fk =?");
        $query->execute([$id]);
        $alldinoHab = $query->fetchAll(PDO::FETCH_OBJ);
        return $alldinoHab;

    }

    public function insertarDino($nombre, $altura, $peso, $alimentacion, $anos, $id_habitat, $descripcion){
        //$pathImg = null;
        $query = $this->db->prepare("INSERT INTO dinos(nombre_cientifico, altura, peso, alimentacion, anios_vivos, id_habitat_fk, descripcion) VALUES(?,?,?,?,?,?,?)");
        $query->execute([$nombre, $altura, $peso, $alimentacion, $anos, $id_habitat, $descripcion]);
        return $this->db->lastInsertId();

    }

    public function actualizarDinos($nombre, $altura, $peso, $alimentacion, $anos, $id_habitat, $descripcion, $id){
        $query = $this->db->prepare("UPDATE dinos SET nombre_cientifico = ?, altura = ?, peso = ?, alimentacion = ?, anios_vivos = ?, id_habitat_fk = ?, descripcion = ? WHERE id_dinosaurio = ?");
        $query->execute([$nombre, $altura, $peso, $alimentacion, $anos, $id_habitat, $descripcion, $id]);
        $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function selectDinoEdit($id){
        $query = $this->db->prepare("SELECT * from dinos WHERE id_dinosaurio=?");
        $query->execute([$id]);
        $dinos = $query->fetch(PDO::FETCH_OBJ);
        return $dinos;
    }

    public function DeleteDinos($id){
        $dinosaurio = $this->selectDinoEdit($id);
        $query = $this->db->prepare('DELETE FROM dinos WHERE id_dinosaurio=?');
        $query->execute([$id]);
    }


}
?>