# Richiedo e installo il core di Drupal e i moduli tramite Composer.
echo "Creazione progetto con Composer..."

# Prendo il path attuale. Serve per installare il sito tramite Composer.
current_path="$(pwd)"

# Creo il progetto.
composer create-project drupal/recommended-project:^"$DRUPAL_VERSION" "${htmlPath}" --no-interaction

# Elimino il plugin che stampa il messaggio per Composer di Drupal. 
composer --working-dir="${htmlPath}" remove drupal/core-project-message

# Richiedo i moduli.
composer --working-dir="${htmlPath}" require \
drupal/admin_toolbar \
drupal/advagg \
drupal/antibot \
drupal/backup_migrate \
drupal/block_access \
drupal/block_content_machine_name \
drupal/editor_file \
drupal/honeypot \
drupal/menu_link_attributes \
drupal/metatag \
drupal/minifyhtml \
drupal/paragraphs \
drupal/pathauto \
drupal/redirect \
drupal/rabbit_hole \
drupal/simple_sitemap \
drupal/slick_views \
drupal/svg_image \
drupal/swiftmailer \
drupal/twig_tweak \
drupal/token \
drupal/webform \
drush/drush

# Installo i vendor.
composer install --working-dir="${htmlPath}"

echo "Fine installazione core e moduli Drupal tramite Composer."