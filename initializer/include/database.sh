# Database: creo utente e db.
echo "Creazione database..."

mysql -hmysql -uroot -p${mysql_root_pass} -e "CREATE DATABASE ${mysql_database_name};"

if [ "${mysql_user_name}" == "" ]; then
mysql_user_name="root"
mysql_user_pass="${mysql_root_pass}"
else
mysql -uroot -p${mysql_root_pass} -e "CREATE USER ${mysql_user_name}@localhost IDENTIFIED BY '${mysql_user_pass}';"
mysql -uroot -p${mysql_root_pass} -e "GRANT ALL PRIVILEGES ON ${mysql_database_name}.* TO '${mysql_user_name}'@'localhost';"
fi

mysql -hmysql -uroot -p${mysql_root_pass} -e "FLUSH PRIVILEGES;"

echo "Fine operazioni su database."