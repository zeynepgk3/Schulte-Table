class Box {
  int number;
  bool isFound;
  bool isTouched;

  Box({this.number,this.isFound,this.isTouched});


  void setNumber(int number){
    this.number=number;
  }
  void setIsFound(bool isFound){
    this.isFound=isFound;
  }
 /* void setIsTouched(bool isFound){
    this.isTouched=isTouched;
  }*/
  int getNumber(){
    return number;
  }
  bool getIsFound(){
    return isFound;
  }
 /* bool getIsTouched(){
    return isTouched;
  }*/
}