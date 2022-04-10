echo "Inizio configurazione tema..."

echo "${tema_nome}"

# Sposto i file del tema base di Corilla all'interno del progetto.
mkdir -p "${htmlPath}"/web/themes/custom
mkdir -p "${htmlPath}"/web/modules/custom

cp -r "${startingFolder}/themes" "${htmlPath}"/web/themes/custom
cp -r "${startingFolder}/modules" "${htmlPath}"/web/modules/custom
cp -r "${startingFolder}/libraries" "${htmlPath}"/web

echo "Fine configurazione tema."