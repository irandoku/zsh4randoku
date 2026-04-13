#!/bin/bash
#
# zsh4humans 完全移除腳本 + 快速恢復方案
# 這是「演練」版本，不會實際執行，只產生報告
#

echo "=== zsh4humans 移除檢查清單 ==="
echo ""

# 需要移除/修改的檔案
echo "📁 將會備份並移除的檔案："
echo "  1. ~/.zshenv → 備份到 ~/.zshenv.z4h-backup.$(date +%Y%m%d)"
echo "  2. ~/.zshrc  → 備份到 ~/.zshrc.z4h-backup.$(date +%Y%m%d)"
echo ""

# 需要清理的快取
echo "🗑️  將會刪除的快取目錄："
echo "  - ~/.cache/zsh4humans/ (整個目錄)"
echo "  - ~/.z4h/ (如果存在)"
echo ""

# 影響範圍
echo "⚠️  影響範圍："
echo "  - 當前開啟的 zsh session 會失去 z4h 功能"
echo "  - 新開的 terminal 會變成「裸 zsh」」
echo "  - tmux session 需要重開"
echo "  - 自訂 alias/function 會消失（除非您額外存了）"
echo ""

# 恢復方案
echo "🔄 快速恢復指令（移除後若要還原）："
echo ""
echo "  # 恢復 z4h"
echo "  cp ~/.zshenv.z4h-backup.$(date +%Y%m%d) ~/.zshenv"
echo "  cp ~/.zshrc.z4h-backup.$(date +%Y%m%d) ~/.zshrc"
echo "  source ~/.zshrc"
echo ""

echo "🚀 安裝 zsh4randoku 步驟："
echo "  1. 確認 ~/.zsh4randoku/ 已建立"
echo "  2. 執行: ~/.zsh4randoku/install.sh"
echo "  3. 複製 example-zshrc: cp ~/.zsh4randoku/example-zshrc ~/.zshrc"
echo "  4. 加入您的自訂設定 (conda, ollama plugin 等)"
echo "  5. source ~/.zshrc"
echo ""

echo "建議時機："
echo "  ⏸️  選個不忙的時段，預留 30 分鐘測試"
echo "  💡 可以的話，先在 tmux 外開個新 terminal 測試"