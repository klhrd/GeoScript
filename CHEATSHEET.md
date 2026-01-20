# **GeoScript 語法速查表 (Cheat Sheet) v2.3.2**

**基本格式**：`變數 = 指令(參數1, 參數2...) { 樣式屬性: 值, ... }`

## **1. 幾何物件 (Primitives)**

| 物件類型 | 指令與範例 | 參數說明 |
| :---- | :---- | :---- |
| **點 (Point)** | P = Point(x, y) <br> P = (2, 3) | 建立座標點 (可簡寫)。 |
| **直線 (Line)** | L = Line(A, B) | 通過 A, B 兩點的無限直線。 |
| **線段 (Segment)** | S = Segment(A, B) | 連接 A, B 的有限線段。 |
| **射線 (Ray)** | R = Ray(A, B) | 以 A 為端點，通過 B 的射線。 |
| **向量 (Vector)** | V = Vector(A, B) | 從 A 指向 B 的向量箭頭。 |
| **圓 (Circle)** | C = Circle(O, r) <br> C = Circle(O, P) <br> C = Circle(A, B, C) | 1. 圓心+半徑 <br> 2. 圓心+圓周上一點 <br> 3. 三點定圓 (外接圓) |
| **多邊形 (Polygon)** | T = Polygon(A, B, C...) | 依序連接頂點，可填色。 |
| **圓弧 (Arc)** | A = Arc(O, P_start, P_end) <br> A = Arc(P1, P2, P3) | 1. 圓心+起點+終點 <br> 2. 三點定弧 (起點, 中間點, 終點) |
| **扇形 (Sector)** | S = Sector(O, P1, P2) | 圓心+起點+終點 (自動封閉區域)。 |

## **2. 建構與關係 (Constructions)**

| 功能 | 指令與範例 | 說明 |
| :---- | :---- | :---- |
| **中點** | M = Midpoint(A, B) | 取兩點連線的中點。 |
| **交點** | P = Intersect(Ob1, Ob2) | 計算直線、圓之間的交點。 |
| **投影/垂足** | P = Project(A, Line) | 點 A 在直線上的垂直投影點。 |
| **切線** | L = Tangent(C, P) | 過圓外一點 P 對圓 C 的切線 (回傳線段)。 |
| **中垂線** | L = Bisector(A, B) | 線段 AB 的垂直平分線。 |
| **角平分線** | L = Bisector(A, B, C) | 角 ABC 的角平分線 (射線)。 |
| **平行線** | L = Parallel(Line, P) | 過 P 點且平行於 Line 的直線。 |
| **垂直線** | L = Perpendicular(Line, P) | 過 P 點且垂直於 Line 的直線。 |

## **3. 特殊幾何中心 (Centers)**

| 中心 | 指令 | 幾何意義 |
| :---- | :---- | :---- |
| **重心** | G = Centroid(A, B, C) | 三中線交點。 |
| **外心** | O = Circumcenter(A, B, C) | 三中垂線交點 (外接圓圓心)。 |
| **內心** | I = Incenter(A, B, C) | 三角平分線交點 (內切圓圓心)。 |
| **垂心** | H = Orthocenter(A, B, C) | 三高線交點。 |

## **4. 變換與動態 (Transformations & Dynamic)**

| 變換 | 指令與範例 | 說明 |
| :---- | :---- | :---- |
| **旋轉** | P' = Rotate(Obj, 45, Center) | 以 Center 為中心旋轉 45 度 (逆時針)。 |
| **平移** | P' = Translate(Obj, Vec) | 依照向量 Vec 移動物件。 |
| **縮放/位似** | P' = Dilate(Obj, 2.0, Center) | 以 Center 為中心縮放 2.0 倍。 |
| **鏡射** | P' = Reflect(Obj, Line) | 對直線進行鏡射 (軸對稱)。 |
| **路徑動點** | P = PointOn(Path, t) | 在圓或線上取點，t 為 0.0~1.0 的參數。 |
| **軌跡** | L = Locus(Target, Driver) | (Beta) 追蹤 Target 隨 Driver 移動的路徑。 |

## **5. 測量 (Measurements)**

這些函數回傳 **數值 (Number)**，通常用於顯示或作為其他函數的參數。

- d = Distance(A, B) : 兩點距離。  
- a = Angle(A, B, C) : 角度 ∠ABC (度數)。  
- m = Slope(Line) : 直線斜率。  
- area = Area(Poly) : 多邊形面積。

## **6. 樣式屬性 (Styles)**

寫在指令後的大括號 { } 中，屬性之間用逗號分隔。

### **通用屬性**

| 屬性 | 值範例 | 說明 |
| :---- | :---- | :---- |
| label | "My Point" | 顯示在物件旁的文字標籤。 |
| color | "red", "#ff0000" | 線條或點的顏色。 |
| visible | false | 隱藏物件 (用於中間運算步驟)。 |
| layer | -1, 5 | 繪製層級 (越小越底層，預設 0)。 |

### **線條與邊框**

| 屬性 | 值範例 | 說明 |
| :---- | :---- | :---- |
| width | 2, 5 | 線條粗細 (px)。 |
| style | "dashed", "dotted" | 線條樣式 (虛線/點線)。 |
| dash | 5 | 自訂虛線間隔大小。 |
| opacity | 0.5 | 線條不透明度 (0.0 ~ 1.0)。 |

### **點專用**

| 屬性 | 值範例 | 說明 |
| :---- | :---- | :---- |
| size | 4, 8 | 點的半徑大小。 |
| style | "cross", "circle" | 點的形狀 (預設為實心圓點)。 |

### **填充 (圓/多邊形/扇形)**

| 屬性 | 值範例 | 說明 |
| :---- | :---- | :---- |
| fillColor | "rgba(0,0,255,0.2)" | 內部填充顏色 (支援 RGBA)。 |
| fillOpacity | 0.3 | 填充透明度 (若未設 Color 則繼承線條色)。 |

## **範例代碼 (Quick Start)**
```js
// 定義三角形頂點  
A = (-2, -1) { label: "A" }  
B = (6, -1)  { label: "B" }  
C = (1, 5)   { label: "C" }

// 繪製三角形 (半透明填充)  
Tri = Polygon(A, B, C) {   
    color: "black",   
    fillColor: "rgba(0,0,0,0.05)"   
}

// 找出 BC邊的中點  
Ma = Midpoint(B, C) {   
    color: "orange",   
    size: 4,   
    label: "Mid"   
}

// 過 A 點做 BC邊的垂線 (高)  
Ha = Project(A, Line(B,C))  
Alt_A = Segment(A, Ha) { style: "dashed" }  
```