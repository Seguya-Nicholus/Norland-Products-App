#include "database.h"
#include <QDir>

Database::Database(QObject *parent) : QObject(parent)
{

}

Database::~Database()
{

}

// Method for connecting to Database
void Database::connectToDataBase()
{
    /* checking if db exists */
    if(!QFile("~/Norland/Database/" DATABASE_NAME).exists()){
        this->restoreDataBase();
    } else {
        this->openDataBase();
    }
}


// Method for creating Database path if it doesnot exist
void Database::createDbPath()
{
    QDir dbPath("~/Norland/Database/" );
    if (!dbPath.exists())
        dbPath.mkpath(".");
}


// Method for creating and opening the database
bool Database::openDataBase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName("~/Norland/Database/" DATABASE_NAME);
    if(db.open()){
        return true;
        qDebug() << "Database Created Successfully";
    } else {
        return false;
    }
}

// Method for restoring Database
bool Database::restoreDataBase()
{
    if(this->openDataBase()){
        return (this->createUsersTable()) ? true : false;
    } else {
        qDebug() << "Failed to restore the database";
        return false;
    }
    return false;
}

void Database::closeDataBase()
{
    db.close();
}

// Method for creating Users Table
bool Database::createUsersTable()
{
    QSqlQuery query;
    if(!query.exec( "CREATE TABLE IF NOT EXISTS Users ("
                    "UserID INTEGER PRIMARY KEY AUTOINCREMENT,"
                    "Username VARCHAR(30) NOT NULL,"
                    "PhoneNumber VARCHAR(20) NOT NULL,"
                    "Password VARCHAR(30) NOT NULL,"
                    "Country VARCHAR(30) NOT NULL"
                    " )"
                    )){
        qDebug() << "DataBase: error of create Users Table" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        qDebug()<<"Users Table Created successfully";
        return true;
    }
    return false;
}

bool Database::createProductsTable()
{
    QSqlQuery query;
    if(!query.exec( "CREATE TABLE IF NOT EXISTS Products ("
                    "ProductID INTEGER PRIMARY KEY AUTOINCREMENT,"
                    "Username VARCHAR(30) NOT NULL,"
                    "PhoneNumber VARCHAR(20) NOT NULL,"
                    "Password VARCHAR(30) NOT NULL,"
                    "Country VARCHAR(30) NOT NULL"
                    " )"
                    )){
        qDebug() << "DataBase: error of create Users Table" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        qDebug()<<"Users Table Created successfully";
        return true;
    }
    return false;
}

bool Database::insertIntoUsersTable(QString UserName, QString PhoneNumber, QString Password, QString Country)
{
    QSqlQuery qry;
    qry.prepare("INSERT INTO Users ("
                "Username,"
                "PhoneNumber,"
                "Password,"
                "Country)"
                "VALUES(?,?,?,?);");

    qry.addBindValue(UserName);
    qry.addBindValue(PhoneNumber);
    qry.addBindValue(Password);
    qry.addBindValue(Country);

    if(!qry.exec()){
        qDebug() << "error inserting into Users Table " ;
        qDebug() << qry.lastError().text();
        return false;
    } else {

        qDebug()<<"User created successfully";
        return true;
    }
    return false;
}

// Method for fetching username and password from the database
bool Database::loginUser(QString PhoneNumber, QString Password)
{
    QSqlQuery qry;
    qry.prepare("SELECT PhoneNumber,Password FROM Users WHERE PhoneNumber=? AND Password =?");

    qry.addBindValue(PhoneNumber);
    qry.addBindValue(Password);

    if (qry.exec())
    {
        if (qry.next())
        {
            qDebug()<<"Query Executed Successfully";
            qDebug() << "PhoneNumber: " + PhoneNumber << " Password :" + Password;
            return true;
        }
    }

    else{

        qDebug() << "error executing Query " ;
        qDebug() << qry.lastError().text();
        return false;

    }
    return false;
}