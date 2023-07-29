
class CommonResponse<T>{
  int? statusCode;
  T? data;
  String? message;


  CommonResponse.fromJson(dynamic json){
    //if(json==null) json={'statusCode':200};
     this.statusCode=json['statusCode'];
    if(statusCode.toString().startsWith('2')){
      this.data=json['response'];
    }
    else{
      if(json['response']!=null&&json['response'] is Map&& json['response']['title']!=null
      ){
        this.message=json['response']['title'];
    }
      else{
        switch(statusCode){
          case 400:
            this.message ='400 Bad Request';
            break;

         case 401:
         this.message ='401 UnAuthorized';
         break;

    case 404:
    this.message ='404 Not Found';
    break;

    case 500:
    this.message ='400 Internal Server Error';
    break;

    case 503:
    this.message ='503 Server unavialable ';
    break;
    }
    }
    }

  }
  bool get getStatus =>statusCode.toString().startsWith('2');

  //?true:false;
}
