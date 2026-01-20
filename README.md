# **GeoScript Compiler (v2.3.2)**

**GeoScript Compiler** 是一個基於網頁的幾何繪圖與編程環境。它允許使用者透過簡單的腳本語言 (GeoScript) 來定義點、線、圓等幾何物件，並即時渲染出高品質的圖形。本專案專為幾何教學、定理驗證與圖形製作而設計。

## **✨ 主要功能 (v2.3.2)**

- **直觀的語法**：類似數學定義的宣告式語言 (e.g., P = Midpoint(A, B)).  
- **即時渲染**：支援自動執行 (Auto-Run)，打字的同時即時看到結果。  
- **強大的幾何核心**：  
    - **基礎物件**：點 (Point)、線 (Line/Segment/Ray)、圓 (Circle)、多邊形 (Polygon)、圓弧 (Arc)、扇形 (Sector)、向量 (Vector)。  
    - **建構指令**：中點 (Midpoint)、交點 (Intersect)、投影 (Project)、切線 (Tangent)、角平分線/中垂線 (Bisector)。  
    - **幾何中心**：外心 (Circumcenter)、重心 (Centroid)、內心 (Incenter)、垂心 (Orthocenter)。  
    - **幾何變換**：平移 (Translate)、旋轉 (Rotate)、縮放/位似 (Dilate)、鏡射 (Reflect)。  
    - **測量函數**：距離 (Distance)、角度 (Angle)、斜率 (Slope)、面積 (Area)。  
- **智慧標籤 (Smart Labeling)**：自動計算標籤位置，避免文字重疊。  
- **互動式畫布**：支援滑鼠拖曳平移 (Pan) 與滾輪縮放 (Zoom)。  
- **樣式系統**：支援自訂顏色、線寬、虛線、透明度填充與圖層 (Layer) 控制。  
- **匯出功能**：一鍵下載高品質 PNG 或 SVG 向量圖。

## **📂 檔案結構**

為了在 GitHub Pages 上正確運作，請確保您的儲存庫 (Repository) 結構如下：  

```
/ (Root)  
├── index.html          # 主程式  
├── README.md           # 說明文件 (本檔案)  
└── examples/           # 範例腳本資料夾  
    ├── basic.geo       # 初始歡迎畫面  
    ├── ninepoint.geo   # 九點圓定理範例  
    ├── simson.geo      # 西姆松線範例  
    ├── visual.geo      # 幾何花朵藝術範例  
    └── fulltest.geo    # 完整語法測試集
```

## **📖 GeoScript 語法速查**

| 指令 | 範例 | 說明 |
| :---- | :---- | :---- |
| **Point** | P = (0, 0) | 建立座標點 |
| **Line** | L = Line(A, B) | 通過 A, B 的直線 |
| **Circle** | C = Circle(O, 5) | 圓心 O，半徑 5 |
| **Polygon** | T = Polygon(A, B, C) | 建立多邊形 |
| **Midpoint** | M = Midpoint(A, B) | 取中點 |
| **Intersect** | P = Intersect(L1, L2) | 取交點 |
| **Rotate** | P' = Rotate(P, 45, O) | 以 O 為中心旋轉 45 度 |

**樣式設定：**

```
// 在指令後方加入 { ... }  
C1 = Circle(O, 5) {   
    color: "red",   
    fillColor: "rgba(255,0,0,0.1)",   
    width: 2,   
    style: "dashed"   
}
```

## **📝 版本紀錄**

* **v2.3.2** (Current): 針對 GitHub Pages 優化，分離範例檔，新增 App Console。  
* **v2.3.1**: 修復顏色填充與透明度問題，優化標籤避讓算法。  
* **v2.3.0**: 新增智慧標籤系統，修復樣式隔離渲染。  
* **v2.2.x**: 核心數學庫大升級 (Arc, Sector, Tangent, Centers...)。
