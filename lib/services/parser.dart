abstract class ObjectParser<T> {
  Map<String, dynamic> toJson(T aT);

  T fromJson(Map<String, dynamic> aTJSon);
}

class ListSerializer<T> {
  final ObjectParser<T> _objectSerializer;

  ListSerializer(this._objectSerializer);

  List<T> parse(List<Map<String, dynamic>> aTJSonList) {
    return aTJSonList
        .map(
          (aTJSon) =>
              _objectSerializer.fromJson(Map<String, dynamic>.from(aTJSon)),
        )
        .toList();
  }

  List<Map<String, dynamic>> stringify(List<T> kOList) {
    return kOList.map((aT) => _objectSerializer.toJson(aT)).toList();
  }
}
