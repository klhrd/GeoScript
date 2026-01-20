// ====== 西姆松線 (The Simson Line) ======
// 定理：過三角形外接圓上任意一點 P，向三邊做垂線，
// 則三個垂足 (Feet) 必共線。

// 1. 定義三角形頂點
A = (-3, -2) { label: "A" }
B = (5, -2)  { label: "B" }
C = (0, 4)   { label: "C" }

// 畫出三角形
Tri = Polygon(A, B, C) { 
    color: "black", 
    fillColor: "rgba(0,0,0,0.05)" 
}

// 2. 建立外接圓 (Circumcircle)
O = Circumcenter(A, B, C) { visible: false }
C_out = Circle(O, A) { 
    color: "gray", 
    dash: 2, 
    opacity: 0.6 
}

// 3. 建立圓上的動點 P (Driver Point)
// 0.1 代表起始位置在圓周的 10% 處
P = PointOn(C_out, 0.1) { 
    label: "P (拖曳我)", 
    color: "red", 
    size: 5,
    style: "circle"
}

// 4. 定義三邊的「直線」 (為了將點投影到線段延伸處)
// Segment 只有有限長度，Line 為無限長
L_BC = Line(B, C) { visible: false }
L_CA = Line(C, A) { visible: false }
L_AB = Line(A, B) { visible: false }

// 5. 找出垂足 (Project P to sides)
Fa = Project(P, L_BC) { label: "Fa", color: "purple", size: 3 }
Fb = Project(P, L_CA) { label: "Fb", color: "purple", size: 3 }
Fc = Project(P, L_AB) { label: "Fc", color: "purple", size: 3 }

// 6. 畫出垂線 (輔助線)
Line_Pa = Segment(P, Fa) { style: "dotted", opacity: 0.4 }
Line_Pb = Segment(P, Fb) { style: "dotted", opacity: 0.4 }
Line_Pc = Segment(P, Fc) { style: "dotted", opacity: 0.4 }

// 7. 驗證西姆松線 (Simson Line)
// 連接其中兩點，第三點應落在線上
L_Simson = Line(Fa, Fc) { 
    color: "blue", 
    width: 2,
    label: "西姆松線"
}

// 8. 進階：生成軌跡 (Locus)
// 當 P 繞圓一周時，垂足 Fa 劃過的軌跡
// 這是一條特殊的曲線
Trace_Fa = Locus(Fa, P) { 
    color: "green", 
    width: 1, 
    opacity: 0.5 
}