echo "Inizio installazione del sito..."

# Creo la cartella di config e vi sposto i file di configurazione, ripuliti.
mkdir -p "${htmlPath}"/web/profiles/corillaprofile/config/install
cp -r profile/corillaprofile.info.yml "${htmlPath}"/web/profiles/corillaprofile/.
cp -r profile/config/sync/* "${htmlPath}"/web/profiles/corillaprofile/config/install/.
find "${htmlPath}"/web/profiles/corillaprofile/config/install/ -type f -exec sed -i -e '/^uuid: /d' {} \;
find "${htmlPath}"/web/profiles/corillaprofile/config/install/ -type f -exec sed -i -e '/_core:/,+1d' {} \;

# Creo le cartelle dei file privati e temporanei di Drupal.
mkdir "${htmlPath}"/private
mkdir "${htmlPath}"/tmp

# Creo la cartella di configurazione.
#mkdir -p "${htmlPath}"/config/sync

# Creo le librerie.
cp -r base/libraries "${htmlPath}"/web

# Lancio l'installazione tramite Drush.
"${htmlPath}"/vendor/bin/drush si \
corillaprofile \
install_configure_form.enable_update_status_emails=NULL \
--locale=it \
--db-url=mysql://"${mysql_user_name}":"${mysql_user_pass}"@${mysql_host}:3306/"${mysql_database_name}" \
--site-name="${drush_sito_nome}" \
--site-mail="${drush_sito_email}" \
--account-name="${drush_admin_nome}" \
--account-mail="${drush_admin_email}" \
--account-pass="${drush_admin_password}" -y

# Controllo le lingue, svuoto la cache, esporto la configurazione.
"${htmlPath}"/vendor/bin/drush locale:check
"${htmlPath}"/vendor/bin/drush locale:update
"${htmlPath}"/vendor/bin/drush cr
"${htmlPath}"/vendor/bin/drush cex -y

echo "Fine installazione del sito ${drush_sito_nome}."