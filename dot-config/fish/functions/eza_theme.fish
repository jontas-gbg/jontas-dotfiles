function eza_theme
    # Kontrollera om ett argument (temanamn) gavs
    if test (count $argv) -ne 1
        echo "Användning: eza_theme <temanamn>"
        echo "Exempel: eza_theme dark"
        return 1
    end

    set -l theme_name $argv[1]
    set -l source_path "$HOME/.local/src/eza-themes/themes/$theme_name.yml"
    set -l link_path "$HOME/.config/eza/theme.yml"

    # Kontrollera om temafilen existerar
    if not test -f "$source_path"
        echo "Fel: Temafilen '$theme_name.yml' hittades inte i källkatalogen." >&2
        return 1
    end

    # Skapa/uppdatera den symboliska länken
    ln -sf "$source_path" "$link_path"

    # Visa ett bekräftelsemeddelande
    echo "Eza-tema ändrat till: $theme_name"
    # Kör eza för att omedelbart visa den nya stilen
    eza -l $PWD

end
