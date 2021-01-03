class Box {
  int number;
  bool isFound;
  int spentTime;

  Box({this.number,this.isFound,this.spentTime});

  void setNumber(int number){
    this.number=number;
  }
  void setIsFound(bool isFound){
    this.isFound=isFound;
  }
  void setSpentTime(int spentTime){
    this.spentTime=spentTime;
  }
  int getNumber(){
    return number;
  }
  bool getIsFound(){
    return isFound;
  }
  int getSpentTime(){
    return spentTime;
  }
}