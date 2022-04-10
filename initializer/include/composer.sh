# Richiedo e installo il core di Drupal e i moduli tramite Composer.
echo "Creazione progetto con Composer..."

# Creo il progetto, se la cartella è vuota.
if [ -z "$(ls -A ${htmlPath})" ]; then
    composer create-project drupal/recommended-project:^"$DRUPAL_VERSION" "${htmlPath}" --no-interaction
fi

# Elimino il plugin che stampa il messaggio per Composer di Drupal. 
# composer --working-dir="${htmlPath}" remove drupal/core-project-message

# Richiedo i moduli.
composer --working-dir="${htmlPath}" require $DRUPAL_DEPS

# drupal/block_access \
# drupal/rabbit_hole \
# drupal/block_content_machine_name \

# Installo i vendor.
composer install --working-dir="${htmlPath}"

echo "Fine installazione core e moduli Drupal tramite Composer."