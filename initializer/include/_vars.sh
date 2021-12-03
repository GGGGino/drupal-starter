############
# Database #
############

# Password di root di MySQL.
mysql_root_pass=""
mysql_root_pass_d="root"

# Host del db
mysql_host=""
mysql_host_d="mysql"

# Nome database da creare.
mysql_database_name=""
mysql_database_name_d="drupal"

# Vuoi creare un utente per il db?
# Se sì, compila i due campi qui sotto, altrimenti lasciali vuoti.
# Username dell'utente da creare.
mysql_user_name=""
mysql_user_name_d=""
# Password dell'utente.
mysql_user_pass=""
mysql_user_pass_d=""

############
# Sito web #
############

# Nome del sito.
drush_sito_nome=""
drush_sito_nome_d="mio"

# Email del sito.
drush_sito_email=""
drush_sito_email_d="david.ginanni@gmail.com"

# Nome dell'account admin.
drush_admin_nome=""
drush_admin_nome_d="admin"

# Email dell'account admin.
drush_admin_email=""
drush_admin_email_d="david.ginanni@gmail.com"

# Password dell'account admin.
# Come caratteri speciali, usa solo trattini,
# perché con gli altri Drush potrebbe avere problemi.
drush_admin_password=""
drush_admin_password_d=""

while getopts 'p:n:f:n:w:e:g:l:u:' arg
do
  case $arg in
    p)  # The mysql root pass
        mysql_root_pass=${OPTARG}
        ;;
    h)  # The mysql root pass
        mysql_host=${OPTARG}
        ;;
    n)  # The mysql db name
        mysql_database_name=${OPTARG}
        ;;
    f)  # If the user wants a custom user
        mysql_user_name=${OPTARG}
        ;;
    n)  # Set the passwor of the wanted user
        mysql_user_pass=${OPTARG}
        ;;
    w)  # The site name
        drush_sito_nome=${OPTARG}
        ;;
    e)  # The site email
        drush_sito_email=${OPTARG}
        ;;
    g)  # The admin username
        drush_admin_nome=${OPTARG}
        ;;
    l)  # The adminemail
        drush_admin_email=${OPTARG}
        ;;
    u)  # The adminpassword
        drush_admin_password=${OPTARG}
        ;;
  esac
done

if [ -z "$mysql_root_pass" ]; then
    echo -n "Mysql root pass ($mysql_root_pass_d): "
    read -s mysql_root_pass
    echo ""
    if [ -z "$mysql_root_pass" ]; then mysql_root_pass=$mysql_root_pass_d; fi
fi

if [ -z "$mysql_host" ]; then
    echo -n "Mysql host ($mysql_host_d): "
    read -r mysql_host
    if [ -z "$mysql_host" ]; then mysql_host=$mysql_host_d; fi
fi

if [ -z "$mysql_database_name" ]; then
    echo -n "Database name ($mysql_database_name_d): "
    read -r mysql_database_name
    if [ -z "$mysql_database_name" ]; then mysql_database_name=$mysql_database_name_d; fi
fi

if [ -z "$mysql_user_name" ]; then
    echo -n "Database user name ($mysql_user_name_d): "
    read -r mysql_user_name
    if [ -z "$mysql_user_name" ]; then mysql_user_name=$mysql_user_name_d; fi
fi

if [ -z "$mysql_user_pass" ]; then
    echo -n "Database user pass ($mysql_user_pass_d): "
    read -s mysql_user_pass
    echo ""
    if [ -z "$mysql_user_pass" ]; then mysql_user_pass=$mysql_user_pass_d; fi
fi

if [ -z "$drush_sito_nome" ]; then
    echo -n "Site name ($drush_sito_nome_d): "
    read -r drush_sito_nome
    if [ -z "$drush_sito_nome" ]; then drush_sito_nome=$drush_sito_nome_d; fi
fi

if [ -z "$drush_sito_email" ]; then
    echo -n "Site email ($drush_sito_email_d): "
    read -r drush_sito_email
    if [ -z "$drush_sito_email" ]; then drush_sito_email=$drush_sito_email_d; fi
fi

if [ -z "$drush_admin_nome" ]; then
    echo -n "Admin name ($drush_admin_nome_d): "
    read -r drush_admin_nome
    if [ -z "$drush_admin_nome" ]; then drush_admin_nome=$drush_admin_nome_d; fi
fi

if [ -z "$drush_admin_email" ]; then
    echo -n "Admin email ($drush_admin_email_d): "
    read -r drush_admin_email
    if [ -z "$drush_admin_email" ]; then drush_admin_email=$drush_admin_email_d; fi
fi

if [ -z "$drush_admin_password" ]; then
    echo -n "Admin password ($drush_admin_password_d): "
    read -s drush_admin_password
    echo ""
    if [ -z "$drush_admin_password" ]; then drush_admin_password=$drush_admin_password_d; fi
fi