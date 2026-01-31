# Message-Based Coordinate Region Detector

Bu proje, **16-bitlik bir giriş mesajından** türetilen **X ve Y koordinatlarına** göre bir noktanın hangi **bölgede (quadrant)** olduğunu belirleyen **kombinezonsal bir Verilog donanım modülünü** ve buna ait **testbench’i** içermektedir.

---

## Proje Amacı

Amaç, 16-bitlik bir mesaj girişini dört adet 4-bit parçaya ayırarak:

- X koordinatını  
- Y koordinatını  

hesaplamak ve bu değerlere göre noktanın **4 farklı bölgeden hangisinde** olduğunu **2 bitlik bir çıktı (`bolge`)** ile ifade etmektir.

Bu yapı, **donanım tabanlı karar mekanizmaları** ve **mesaj sınıflandırma uygulamaları** için örnek teşkil eder.

---

## Modül Yapısı

### Girişler
- `mesaj [15:0]` : 16-bit veri girişi

### Çıkışlar
- `bolge [1:0]` : Hesaplanan bölge bilgisi

---

## Çalışma Mantığı

### 1. Mesajın Parçalanması

16-bit mesaj dört adet 4-bit parçaya ayrılır:

```verilog
MSB1 = mesaj[15:12]
MSB2 = mesaj[11:8]
MSB3 = mesaj[7:4]
MSB4 = mesaj[3:0]
```

### 2. Koordinat Hesabı
Bit düzeyinde OR (|) işlemi ile koordinatlar üretilir:

```verilog
X = MSB2 | MSB3
Y = MSB1 | MSB4
```

### 3. Bölge Belirleme
X ve Y değerleri 7 eşik değeri ile karşılaştırılır ve 4 bölgeden biri seçilir:
| Y Durumu | X Durumu | Bölge (`bolge`) |
| -------- | -------- | --------------- |
| Y > 7    | X > 7    | `11`            |
| Y > 7    | X ≤ 7    | `00`            |
| Y ≤ 7    | X > 7    | `10`            |
| Y ≤ 7    | X ≤ 7    | `01`            |


## Testbench

Projede yer alan testbench (`tb_koordinat_belirleme`) şu amaçlarla kullanılır:

- Farklı 16-bit mesaj değerleri uygulanır  
- Her mesaj için bölge çıktısı gözlemlenir  
- Modülün doğru çalıştığı doğrulanır  
