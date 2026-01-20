// ==========================================
// GeoScript 完整語法測試圖籍 (Full Syntax Test Suite)
// 用途：編譯器功能驗證與壓力測試
// 涵蓋版本：Guidebook v1.0 所有功能
// ==========================================

// ------------------------------------------
// 1. 基礎物件 (Primitives)
// ------------------------------------------
// 1.1 點 (Points) - 絕對座標與簡寫
P1 = Point(-5, -5) { label: "P1(Base)", color: "black", size: 3 }
P2 = (5, -5)       { label: "P2", style: "cross", color: "blue" }
P3 = (0, 4)        { label: "P3", size: 5, color: "red" }

// 1.2 線性物件 (Linear Objects)
Line_Base = Line(P1, P2)     { color: "gray", width: 1 }         // 無限直線
Seg_Side1 = Segment(P1, P3)  { color: "green", width: 2 }        // 線段
Ray_Side2 = Ray(P2, P3)      { color: "orange", dash: 2 }        // 射線

// 1.3 圓 (Circles)
// 圓心-半徑模式
C_Main = Circle((0,0), 3)    { stroke: "purple", fillOpacity: 0.05 }
// 圓心-點模式
C_Corner = Circle(P1, P3)    { style: "dotted", visible: false }

// 1.4 多邊形 (Polygon)
Poly_Tri = Polygon(P1, P2, P3) { 
    fillColor: "rgba(0, 255, 0, 0.1)", 
    strokeWidth: 0,
    layer: -5 
}

// ------------------------------------------
// 2. 幾何關係 (Relations)
// ------------------------------------------
// 2.1 中點 (Midpoint)
M_Base = Midpoint(P1, P2) { label: "M_Base", style: "dot" }

// 2.2 交點 (Intersect)
// 線與圓交點 (預期 2 點)
Inter_LC = Intersect(Line_Base, C_Main) { color: "red", size: 4 }
// 射線與線段交點
Inter_RaySeg = Intersect(Ray_Side2, Seg_Side1) { label: "I_Cross" }

// 2.3 平行與垂直 (Parallel & Perpendicular)
Line_Para = Parallel(Line_Base, P3)      { style: "dashed", color: "blue" }
Line_Perp = Perpendicular(Line_Base, P3) { style: "dashed", color: "blue" }

// 2.4 投影/垂足 (Project)
Foot_P3 = Project(P3, Line_Base) { label: "垂足", color: "magenta" }

// 2.5 切線 (Tangent)
Tan_Lines = Tangent(C_Main, P2) { color: "brown", opacity: 0.5 }

// 2.6 平分線 (Bisectors)
Bisect_Ang = Bisector(P1, P3, P2) { color: "cyan" }  // 角平分線
Bisect_Perp = Bisector(P1, P3)    { color: "cyan" }  // 中垂線

// ------------------------------------------
// 3. 進階圖形 (Advanced Shapes)
// ------------------------------------------
// 3.1 圓弧 (Arc)
// 三點定弧
Arc_3P = Arc(P1, (0, -6), P2) { color: "navy", width: 3 }
// 圓心角定弧
Arc_Center = Arc((0,0), (1,1), (-1,1)) { color: "teal" }

// 3.2 扇形 (Sector)
Sec_Test = Sector((0,0), (2,0), (0,2)) { 
    fillColor: "yellow", 
    fillOpacity: 0.3 
}

// 3.3 三角形中心 (Triangle Centers)
In_C = Incenter(P1, P2, P3)      { label: "I", size: 2 }
Cent_G = Centroid(P1, P2, P3)    { label: "G", size: 2 }
Circ_O = Circumcenter(P1, P2, P3){ label: "O", size: 2 }
Orth_H = Orthocenter(P1, P2, P3) { label: "H", size: 2 }

// ------------------------------------------
// 4. 幾何變換 (Transformations)
// ------------------------------------------
// 4.1 平移 (Translate)
// 定義一個向量用於平移
Vec_T = Vector((0,0), (2, 2))
P_Trans = Translate(P1, Vec_T) { label: "P1'", color: "gray" }

// 4.2 旋轉 (Rotate)
// 將三角形繞原點旋轉 90 度
Tri_Rot = Rotate(Poly_Tri, 90, (0,0)) { 
    fillColor: "rgba(255,0,0,0.1)", 
    dash: 2 
}

// 4.3 鏡射 (Reflect)
// 以 Y 軸 (由兩點定義的線) 為對稱軸
Axis_Y = Line((0,-5), (0,5)) { visible: false }
P2_Reflect = Reflect(P2, Axis_Y) { label: "P2_Mir", style: "cross" }

// 4.4 縮放 (Dilate)
// 以 P1 為中心，將 C_Main 縮小 0.5 倍
C_Small = Dilate(C_Main, 0.5, P1) { color: "black", width: 1 }

// ------------------------------------------
// 5. 向量與測量 (Vectors & Measurements)
// ------------------------------------------
// 5.1 向量運算
v1 = Vector(P1, P2)
v2 = Vector(P1, P3)
v_sum = Add(v1, v2) // 用於內部計算，可能不直接顯示

// 5.2 數值測量 (通常用於 UI 顯示或變數存儲)
dist_val = Distance(P1, P2)
ang_val = Angle(P1, P2, P3)
slope_val = Slope(Line_Base)
area_val = Area(Poly_Tri)

// ------------------------------------------
// 6. 動態軌跡 (Locus) - 壓力測試區
// ------------------------------------------
// 6.1 綁定點
// 在 C_Main 上建立一個動點 Driver
Driver = PointOn(C_Main, 0.0) { label: "Driver", color: "red", size: 4 }

// 6.2 定義從動點
// 這裡建立一個簡單機制：Driver 連接 P3 的中點
Tracer = Midpoint(Driver, P3) { label: "Tracer", size: 2 }

// 6.3 生成軌跡
// 當 Driver 繞圓一週，Tracer 走過的路徑 (應該是一個小圓)
Path_Locus = Locus(Tracer, Driver) { 
    color: "magenta", 
    width: 3, 
    opacity: 0.6 
}

// ------------------------------------------
// 7. 樣式系統測試 (Styling Edge Cases)
// ------------------------------------------
// 測試極限值與層級
Test_Layer_Top = Circle((0,0), 1) { 
    layer: 10, 
    fillColor: "white", 
    fillOpacity: 1.0,
    stroke: "black"
}

Test_Invisible = Point(0,0) { 
    visible: false, 
    label: "Hidden" 
}