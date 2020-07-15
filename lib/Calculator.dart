import 'dart:math';

class Calculator{
  Calculator({this.height, this.weight});
  
  final int height;
  final int weight;

  double _bmi;
  
  String calculate(){
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if(_bmi>= 25){
      return 'اضافه وزن';
    } else if(_bmi>18.5){
      return 'نرمال';
    }else {
      return 'کمبود وزن';
    }
  }
  String getInterpretation(){
    if(_bmi>= 25){
      return 'شاخص توده بدنی‌ت بیشتر از حد نرماله. سعی کن بیشتر ورزش کنی!';
    } else if(_bmi>18.5){
      return 'شاخص توده بدنی‌ت نرماله. باریکلا! :)';
    }else {
      return 'شاخص توده بدنی‌ت پایین‌تر از حد نرماله، یکم بیشتر به خودت برس!';
    }
  }
}