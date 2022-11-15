<?php

class APIview{
    //vista en postman
    public function response($data, $status){
        header("Content-Type: application/json");
        header("HTTP/1.1 " . $status . " " . $this->_requestStatus($status));
        echo json_encode($data);
    }

    //estado de la request
    private function _requestStatus($code){
        $status = array(
            200 => "OK",
            201 => "Created",
            400 => "Bad request",
            401 => "Unauthorized",
            403 => "Forbidden",
            404 => "not found",
            500 => "Internal Server Error"
        );
        return (isset($status[$code])? $status[$code] : $status[500]);
    }
}