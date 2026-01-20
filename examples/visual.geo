// ====== 幾何花朵 (Geometric Flower) ======
// 透過旋轉對稱性創造經典的「生命之種」圖案
// 展示功能：Rotate, Polygon, Circle, Styling

// 1. 定義中心與起始參數
O = (0, 0) { visible: false }

// 2. 第一層花瓣：彩虹六瓣花
// 定義頂點 (半徑為 5)
P1 = (0, 5) { visible: false }

// 利用旋轉 (Rotate) 快速生成正六邊形的頂點
P2 = Rotate(P1, 60, O) { visible: false }
P3 = Rotate(P2, 60, O) { visible: false }
P4 = Rotate(P3, 60, O) { visible: false }
P5 = Rotate(P4, 60, O) { visible: false }
P6 = Rotate(P5, 60, O) { visible: false }

// 繪製花瓣 (圓心在頂點，半徑皆為 5，必過中心 O)
// 使用半透明填充製造混色效果
C1 = Circle(P1, 5) { color: "#FF0000", width: 2, fillOpacity: 0.1 } // 紅
C2 = Circle(P2, 5) { color: "#FFA500", width: 2, fillOpacity: 0.1 } // 橙
C3 = Circle(P3, 5) { color: "#FFFF00", width: 2, fillOpacity: 0.1 } // 黃
C4 = Circle(P4, 5) { color: "#008000", width: 2, fillOpacity: 0.1 } // 綠
C5 = Circle(P5, 5) { color: "#0000FF", width: 2, fillOpacity: 0.1 } // 藍
C6 = Circle(P6, 5) { color: "#800080", width: 2, fillOpacity: 0.1 } // 紫

// 3. 幾何結構線
// 連接圓心形成正六邊形
Hex = Polygon(P1, P2, P3, P4, P5, P6) { 
    color: "gold", 
    width: 3,
    fillColor: "rgba(255, 215, 0, 0.05)" 
}

// 4. 第二層裝飾：交錯星芒
// 將原本的六邊形旋轉 30 度，形成交錯感
Hex_Star = Rotate(Hex, 30, O) { 
    style: "dotted", 
    color: "gray", 
    width: 1,
    fillOpacity: 0
}

// 5. 外框
// 內接圓 (連接所有花瓣中心)
C_Inner = Circle(O, 5) { 
    style: "dashed", 
    color: "black", 
    opacity: 0.3 
}

// 外包圍圓 (花瓣最外圍距離中心是 2 * R = 10)
C_Outer = Circle(O, 10) { 
    color: "black", 
    width: 4,
    fillColor: "rgba(0,0,0,0)" // 透明填充
}

// 6. 點綴 (中心花蕊)
Core = Circle(O, 1) { 
    fillColor: "gold", 
    color: "orange",
    opacity: 0.8
}