# Universal archive extractor
# Usage: extract <file>
extract() {
    local file="$1"
    [[ -z "$file" ]] && { echo "Usage: extract <file>"; return 1 }
    [[ ! -f "$file" ]] && { echo "extract: '$file' not found"; return 1 }
    
    case "$file" in
        *.tar.bz2|*.tbz2)  tar xjf "$file"  ;;
        *.tar.gz|*.tgz)   tar xzf "$file"  ;;
        *.tar.xz|*.txz)   tar xJf "$file"  ;;
        *.tar.zst|*.tzst) tar --zstd -xf "$file"  ;;
        *.bz2)            bunzip2 "$file"  ;;
        *.gz)             gunzip "$file"   ;;
        *.xz)             unxz "$file"     ;;
        *.zip)            unzip "$file"    ;;
        *.7z)             7z x "$file"     ;;
        *.rar)            unrar x "$file"  ;;
        *.tar)            tar xf "$file"   ;;
        *.Z)              uncompress "$file" ;;
        *)
            echo "extract: '$file' - unknown archive format"
            return 1
            ;;
    esac
    echo "✅ Extracted: $file"
}