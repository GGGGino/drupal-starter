echo "Configurazione del tema figlio..."

# Creo il nome macchina del tema.
tema_nome="${drush_sito_nome,,}"
tema_nome="${tema_nome// /}"

# Creo cartelle e file.
mkdir -p "${htmlPath}"/web/themes/custom/"${tema_nome}"
cp -r "${htmlPath}"/web/themes/contrib/bootstrap/starterkits/sass/* "${htmlPath}"/web/themes/custom/"${tema_nome}"

# Inserisco il file di configurazione di Compass.
cat > "${htmlPath}"/web/themes/custom/"${tema_nome}"/config.rb <<EOF
require 'compass/import-once/activate'
# Require any additional compass plugins here.

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "css"
sass_dir = "scss"
images_dir = "images"
javascripts_dir = "js"

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed
output_style = :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false


# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

require 'autoprefixer-rails'

on_stylesheet_saved do |file|
  css = File.read(file)
  map = file + '.map'

  if File.exists? map
    result = AutoprefixerRails.process(css,
      from: file,
      to:   file,
      map:  { prev: File.read(map), inline: false })
    File.open(file, 'w') { |io| io << result.css }
    File.open(map,  'w') { |io| io << result.map }
  else
    File.open(file, 'w') { |io| io << AutoprefixerRails.process(css) }
  end
end
EOF

# Recupero Bootstrap (framework).
wget https://github.com/twbs/bootstrap-sass/archive/v3.4.1.tar.gz
tar  -xzf v3.4.1.tar.gz
mv bootstrap-sass-3.4.1 bootstrap
mv bootstrap "${htmlPath}"/web/themes/custom/"${tema_nome}"
rm v3.4.1.tar.gz

# Rinomino i file e i contenuti, dove necessario.
cp "${htmlPath}"/web/themes/custom/"${tema_nome}"/config/install/THEMENAME.settings.yml \
"${htmlPath}"/web/themes/custom/"${tema_nome}"/config/install/"${tema_nome}".settings.yml

sed -i "s/THEMENAME/${tema_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_nome}"/config/schema/THEMENAME.schema.yml
sed -i "s/THEMETITLE/${drush_sito_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_nome}"/config/schema/THEMENAME.schema.yml
cp "${htmlPath}"/web/themes/custom/"${tema_nome}"/config/schema/THEMENAME.schema.yml \
"${htmlPath}"/web/themes/custom/"${tema_nome}"/config/schema/"${tema_nome}".schema.yml

cp "${htmlPath}"/web/themes/custom/"${tema_nome}"/THEMENAME.libraries.yml \
"${htmlPath}"/web/themes/custom/"${tema_nome}"/"${tema_nome}".libraries.yml

sed -i "s/THEMENAME/${tema_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_nome}"/THEMENAME.starterkit.yml
sed -i "s/THEMETITLE/${drush_sito_nome}/g" "${htmlPath}"/web/themes/custom/"${tema_nome}"/THEMENAME.starterkit.yml
sed -i "s/base theme: bootstrap/base theme: corillabase/g" "${htmlPath}"/web/themes/custom/"${tema_nome}"/THEMENAME.starterkit.yml
cp "${htmlPath}"/web/themes/custom/"${tema_nome}"/THEMENAME.starterkit.yml \
"${htmlPath}"/web/themes/custom/"${tema_nome}"/"${tema_nome}".info.yml

cp "${htmlPath}"/web/themes/custom/"${tema_nome}"/THEMENAME.theme \
"${htmlPath}"/web/themes/custom/"${tema_nome}"/"${tema_nome}".theme

echo "Fine configurazione del tema figlio."