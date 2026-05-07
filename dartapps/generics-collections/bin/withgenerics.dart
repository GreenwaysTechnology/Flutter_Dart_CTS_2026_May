class Data<T> {
  T? data;

  Data(this.data);
}
class Map<K, V> {
  K? Key;
  V? Value;

  Map(this.Key, this.Value);
}

void main(){
  Data intData = Data<int>(10);
  Data doubleData = Data<double>(10.5);
  Data stringData = Data<String>('hello');
  Map map = Map<int, String>(1, "Value");

  print(intData.data);
  print(doubleData.data);
  print(stringData.data);
  print(map.Key);
  print(map.Value);

}
