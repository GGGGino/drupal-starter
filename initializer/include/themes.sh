echo "Inizio configurazione tema..."

echo "${tema_nome}"

# Sposto i file del tema base di Corilla all'interno del progetto.
mkdir -p "${htmlPath}"/web/themes/custom
cp -r base/corillabase "${htmlPath}"/web/themes/custom/"${tema_nome}"
cp -r libraries/* "${htmlPath}"/web/libraries
cp -r modules/* "${htmlPath}"/web/modules

# Rinomino i file e i contenuti, dove necessario.
sed -i "s/corillabase/${tema_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_nome}"/config/schema/corillabase.schema.yml
sed -i "s/Corilla Base/${drush_sito_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_nome}"/config/schema/corillabase.schema.yml
cp "${htmlPath}"/web/themes/custom/"${tema_nome}"/config/schema/corillabase.schema.yml \
"${htmlPath}"/web/themes/custom/"${tema_nome}"/config/schema/"${tema_nome}".schema.yml

sed -i "s/corillabase/${tema_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_nome}"/corillabase.libraries.yml
cp "${htmlPath}"/web/themes/custom/"${tema_nome}"/corillabase.libraries.yml \
"${htmlPath}"/web/themes/custom/"${tema_nome}"/"${tema_nome}".libraries.yml

sed -i "s/corillabase/${tema_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_nome}"/corillabase.info.yml
sed -i "s/Corilla Base/${drush_sito_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_nome}"/corillabase.info.yml
cp "${htmlPath}"/web/themes/custom/"${tema_nome}"/corillabase.info.yml \
"${htmlPath}"/web/themes/custom/"${tema_nome}"/"${tema_nome}".info.yml

cp "${htmlPath}"/web/themes/custom/"${tema_nome}"/corillabase.theme \
"${htmlPath}"/web/themes/custom/"${tema_nome}"/"${tema_nome}".theme

sed -i "s/corillabase/${tema_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_nome}"/js/corillabase.js
cp "${htmlPath}"/web/themes/custom/"${tema_nome}"/js/corillabase.js \
"${htmlPath}"/web/themes/custom/"${tema_nome}"/js/"${tema_nome}".js

echo "Fine configurazione tema."