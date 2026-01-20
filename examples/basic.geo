// ==========================================
// 歡迎使用 GeoScript (GeoScript Welcome Demo)
// 這是一個綜合演示，展示點、線、圓、切線與互動功能
// ==========================================

// 1. 建立基礎環境
// ------------------------------------------
// 建立原點
Origin = Point(0, 0) { label: "O", color: "black", size: 3 }

// 建立一個主圓 (半徑為 3)
C1 = Circle(Origin, 3) { 
    color: "blue", 
    fillColor: "rgba(0, 0, 255, 0.05)",
    width: 2 
}

// 2. 建立互動元素
// ------------------------------------------
// 在圓外建立一個「可拖曳」的控制點
// 這裡我們直接給定一個座標，使用者可在介面上嘗試修改它
Control_P = (-5, 2) { 
    label: "P (控制點)", 
    color: "red", 
    style: "cross",
    size: 5 
}

// 在圓上建立一個「滑動點」
// 這個點被限制在圓周上移動，適合觀察動態變化
Slider_S = PointOn(C1, 0.0) {
    label: "S (滑動)",
    color: "green",
    size: 4
}

// 3. 進階幾何構圖：切線與交點
// ------------------------------------------
// 自動計算從控制點 P 到圓 C1 的兩條切線
Tan_Lines = Tangent(C1, Control_P) { 
    color: "orange", 
    style: "dashed",
    opacity: 0.6 
}

// 找出切線與圓的切點 (T1, T2)
// Intersect 會自動算出切線與圓的交點
Cut_Points = Intersect(Tan_Lines, C1) { 
    label: "T", 
    color: "orange", 
    size: 3 
}

// 為了方便後續作圖，我們手動提取這兩個切點 (假設系統支援陣列索引或我們再次定義)
// 這裡示範直接連接控制點與原點
Line_PO = Segment(Control_P, Origin) { 
    color: "gray", 
    width: 1 
}

// 4. 形成幾何圖形
// ------------------------------------------
// 連接 P, S, O 形成一個動態三角形
// 當 S 在圓上滑動時，這個三角形形狀會改變
Tri_PSO = Polygon(Control_P, Slider_S, Origin) {
    fillColor: "rgba(0, 255, 0, 0.1)",
    stroke: "none"
}

// 5. 測量與標註
// ------------------------------------------
// 顯示 P 點到原點的距離
Dist_PO = Distance(Control_P, Origin) // 數值計算

// 6. 裝飾性元素
// ------------------------------------------
// 畫出滑動點 S 的半徑
Radius_S = Segment(Origin, Slider_S) { 
    style: "dotted", 
    color: "blue" 
}