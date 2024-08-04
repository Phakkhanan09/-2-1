import 'dart:io';

void main() {
  stdout.write('s = ');
  String? s = stdin.readLineSync();
  if (s != null) {
    Map<String, int> m = stringCount(s);
    printMap(m);
  } else {
    print('Input is null');
  }
}

Map<String, int> stringCount(String s) {
  Map<String, int> map = {}; //สร้าง Map ว่างขึ้นมา จะมี Key กับ Value
  s = s.toLowerCase(); //ทำให้มันเป็นตัวพิมพ์เล็ก
  for (int i = 0; i < s.length; i++) {// เช็คว่า i มันน้อยกว่า ข้อมูลใน s มั้ย
    String alphabet = s[i]; //ถ้ามัน i มันน้อยกว่าข้อมูลที่ป้อน(ข้อมูลใน s) มันก็จะเอา S ในตำแหน่ง i มาเก็บไว้ที่ ตัวแปร alphabet ที่มีชนิดข้อมูล แบบ String
    if (map.containsKey(alphabet)) {
      map[alphabet] = map[alphabet]! + 1; // ถ้าตัวอักษรมีอยู่ในmapที่แล้ว ให้เพิ่มค่าขึน 1
    } else {
      map[alphabet] = 1; //แต่ถ้าไม่มีก็ให้เป็น 1 ไปเลย
    }
  }
  return map;
}


  void printMap(Map<String, int> m) {
  List<MapEntry<String, int>> entries = m.entries.toList();
  for (int i = 0; i < entries.length; i++) {  //ลูปนอก เลือกหาตำแหน่งของคู่ Key  และ Value ใน List ที่จะจัดเรียง
    for (int j = i + 1; j < entries.length; j++) { //ลูปใน จะเปรียบเทียบคู่ Key และ Value ในตำแหน่งที่ i 
      if (entries[i].value < entries[j].value || //ถ้าค่าของ Key กับ ค่าตำแหน่ง i น้อยกว่าค่าของคู่ Key ที่ตำปหน่ง j  หรือ ค่าทั้งสองมันเท่ากันแต่ Key ที่ตำแหน่ง i มากกว่าลำดับตัวอักษร 
          (entries[i].value == entries[j].value && entries[i].key.compareTo(entries[j].key) > 0)) {
        var temp = entries[i];      //ถ้าเงื่อนไขเป็นจริง ให้สลับตำแหน่ง i และ j
        entries[i] = entries[j];
        entries[j] = temp;
      }
    }
  }
  for (var entry in entries) {    //ลูปนี้วนผ่าน List ของคู่ Key และ ค่าที่ถูกจัดเรียงแล้ว และพิมพ์ Key และค่า ในรูปแบบ key -> value
    print('${entry.key} -> ${entry.value}');   
  }
}

