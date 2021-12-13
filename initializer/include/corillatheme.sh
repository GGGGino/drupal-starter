# Creo il nome macchina del tema.
echo "Configurazione del tema CorillaBase..."

tema_corilla_titolo="Corilla Base"
tema_corilla_nome="${tema_corilla_titolo,,}"
tema_corilla_nome="${tema_corilla_nome// /}"

# Creo cartelle e file.
mkdir -p "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"
cp -r "${htmlPath}"/web/themes/contrib/bootstrap/starterkits/sass/* "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"

# Recupero Bootstrap (framework).
wget https://github.com/twbs/bootstrap-sass/archive/v3.4.1.tar.gz
tar -xzf v3.4.1.tar.gz
mv bootstrap-sass-3.4.1 bootstrap
mv bootstrap "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"
rm v3.4.1.tar.gz

# Configuro il tema CorillaBase.
cp "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/config/install/THEMENAME.settings.yml \
"${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/config/install/"${tema_corilla_nome}".settings.yml

sed -i "s/THEMENAME/${tema_corilla_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/config/schema/THEMENAME.schema.yml
sed -i "s/THEMETITLE/${tema_corilla_titolo}/g" "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/config/schema/THEMENAME.schema.yml
cp "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/config/schema/THEMENAME.schema.yml \
"${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/config/schema/"${tema_corilla_nome}".schema.yml

cp "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/THEMENAME.libraries.yml \
"${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/"${tema_corilla_nome}".libraries.yml

sed -i "s/THEMENAME/${tema_corilla_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/THEMENAME.starterkit.yml
sed -i "s/THEMETITLE/${tema_corilla_titolo}/g" "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/THEMENAME.starterkit.yml
cp "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/THEMENAME.starterkit.yml \
"${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/"${tema_corilla_nome}".info.yml

cp "${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/THEMENAME.theme \
"${htmlPath}"/web/themes/custom/"${tema_corilla_nome}"/"${tema_corilla_nome}".theme

echo "Fine configurazione del tema CorillaBase."