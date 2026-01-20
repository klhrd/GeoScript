// ====== 九點圓 (Nine-Point Circle) 完整展示 ======
// 包含歐拉線 (Euler Line) 驗證

// 1. 定義三角形
A = (-2, -1)
B = (6, -1)
C = (1, 5)
Tri = Polygon(A, B, C) { color: "black", fillOpacity: 0.05 }

// 2. 邊的中點 (Midpoints)
Ma = Midpoint(B, C) { size: 3, color: "orange", label: "Ma" }
Mb = Midpoint(C, A) { size: 3, color: "orange", label: "Mb" }
Mc = Midpoint(A, B) { size: 3, color: "orange", label: "Mc" }

// 3. 垂足 (Feet of Altitudes)
Fa = Project(A, Line(B, C)) { size: 3, color: "purple" }
Fb = Project(B, Line(C, A)) { size: 3, color: "purple" }
Fc = Project(C, Line(A, B)) { size: 3, color: "purple" }

// 4. 垂心 (Orthocenter)
// 畫出高線 (Altitudes)
La = Segment(A, Fa) { style: "dotted", opacity: 0.5 }
Lb = Segment(B, Fb) { style: "dotted", opacity: 0.5 }
Lc = Segment(C, Fc) { style: "dotted", opacity: 0.5 }

// 垂心 H 為高線交點
H = Intersect(La, Lb) { label: "H (垂心)", color: "red", size: 4 }

// 5. 歐拉點 (Euler Points: 頂點到垂心連線中點)
Ea = Midpoint(A, H) { size: 3, color: "green" }
Eb = Midpoint(B, H) { size: 3, color: "green" }
Ec = Midpoint(C, H) { size: 3, color: "green" }

// 6. 九點圓 (Nine-Point Circle)
// 性質：過三邊中點、三垂足、三歐拉點
Circle9 = Circle(Ma, Mb, Mc) { 
    color: "magenta", 
    width: 2,
    fillColor: "rgba(255, 0, 255, 0.1)" 
}

// 7. 重心 (Centroid)
// 畫出中線 (Medians)
LMa = Segment(A, Ma) { visible: false }
LMb = Segment(B, Mb) { visible: false }
LMc = Segment(C, Mc) { visible: false }

// 重心 G 為中線交點
G = Intersect(LMa, LMc) { label: "G (重心)", color: "blue", size: 4 }

// 8. 外心 (Circumcenter)
O = Circumcenter(A, B, C) { label: "O (外心)", color: "black", size: 4 }

// 9. 驗證九點圓圓心 N
// 九點圓的圓心 N 應為 "垂心 H" 與 "外心 O" 的中點
N = Circumcenter(Ma, Mb, Mc) { label: "N", color: "magenta", size: 4 }

// 10. 歐拉線 (Euler Line)
// 連接 H, N, G, O 四點共線
L = Line(H, N) { 
    color: "blue", 
    width: 3, 
    opacity: 0.3, 
    layer: -1,
    label: "歐拉線"
}