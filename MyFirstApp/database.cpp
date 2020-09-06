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
        return (this->createUsersTable() && this->createProductsTable()) ? true : false;
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
                    //                    "ProductID INTEGER PRIMARY KEY AUTOINCREMENT,"
                    "ProductID VARCHAR(10) PRIMARY KEY,"
                    "ImagePath BLOB NOT NULL,"
                    "ProductName VARCHAR(20) NOT NULL,"
                    "ProductText VARCHAR(30) NOT NULL,"
                    "Cost VARCHAR(30) NOT NULL"
                    " )"
                    )){
        qDebug() << "DataBase: error of create Products Table" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        qDebug()<<"Products Table Created successfully";

        // Inserting Dummy Products into the Products Table

        insertIntoProductsTable("220001","../../assets/products/product1.png","Vision Vitale","Capsules","UGX 150,000");
        insertIntoProductsTable("220002","../../assets/products/product2.png","Hypoglycemic","Herbal Capsules","UGX 230,000");
        insertIntoProductsTable("220003","../../assets/products/product3.png","Immune +","Capsules","UGX 250,000");
        insertIntoProductsTable("220004","../../assets/products/product4.png","Propolis-Lecmon","Capsules","UGX 240,000");
        insertIntoProductsTable("220005","../../assets/products/product5.png","Lamberts","Natural Carotene","UGX 140,000");
        insertIntoProductsTable("220006","../../assets/products/product7.png","Soap","Bathing","UGX 100,000");
        insertIntoProductsTable("220007","../../assets/products/product8.png","Soap","Skin","UGX 100,000");
        insertIntoProductsTable("220008","../../assets/products/product9.png","Norland Herbal","Toothpaste","UGX 150,000");
        insertIntoProductsTable("220009","../../assets/products/product10.png","Men Health","Care Pad","UGX 170,000");
        insertIntoProductsTable("220010","../../assets/products/product12.png","Kuding","Tea","UGX 80,000");
        insertIntoProductsTable("220011","../../assets/products/product13.png","Gastrointestinal","Capsules","UGX 250,000");
        insertIntoProductsTable("220012","../../assets/products/Pad.jpg","Pad","pads","UGX 150,000");
        insertIntoProductsTable("220013","../../assets/products/Pad2.png","Pad","pads","UGX 150,000");
        insertIntoProductsTable("220014","../../assets/products/product16.png","Keto Actives","Weight Loss Regimen","UGX 120,000");
        insertIntoProductsTable("220015","../../assets/products/product17.png","Calcium Iron Zinc","Capsules","UGX 200,000");
        insertIntoProductsTable("220016","../../assets/products/product18.png","Hypoglycemic","Anti-aging Protein","UGX 250,000");
        //        insertIntoProductsTable("../../assets/products/product1.png","Vision Vitale","Capsules","UGX 150,000");
        //        insertIntoProductsTable("../../assets/products/product1.png","Vision Vitale","Capsules","UGX 150,000");
        //        insertIntoProductsTable("../../assets/products/product1.png","Vision Vitale","Capsules","UGX 150,000");
        //        insertIntoProductsTable("../../assets/products/product1.png","Vision Vitale","Capsules","UGX 150,000");

        return true;
    }
    return false;
}


// Method for inserting into the Users Table
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


// Method for inserting into Prducts Table
bool Database::insertIntoProductsTable(QString ProductID,QByteArray ImagePath, QString ProductName, QString ProductText, QString Cost)
{
    QSqlQuery qry;
    qry.prepare("INSERT INTO Products ("
                "ProductID,"
                "ImagePath,"
                "ProductName,"
                "ProductText,"
                "Cost)"
                "VALUES(?,?,?,?,?);");

    qry.addBindValue(ProductID);
    qry.addBindValue(ImagePath);
    qry.addBindValue(ProductName);
    qry.addBindValue(ProductText);
    qry.addBindValue(Cost);

    if(!qry.exec()){
        qDebug() << "error inserting into Products Table " ;
        qDebug() << qry.lastError().text();
        return false;
    } else {

        qDebug()<<"Product created successfully";
        return true;
    }
    return false;
}

// Method for fetching phoneNumber and password from the database
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

// Method to return Username depending on Phone Number and Password
QString Database::getUsername(QString PhoneNumber, QString Password)
{
    QSqlQuery query("SELECT Username FROM Users WHERE PhoneNumber= '"+ PhoneNumber +"' AND Password ='" + Password + "'");
    while (query.next()) {
        QString Username = query.value(0).toString();
        return(Username);
    }
    return 0;
}


// Methd to return Product by Id
bool Database::returnProductRecord(const int id)
{
    QSqlQuery query;

    query.prepare("SELECT ImagePath, ProductName, ProductText, Cost FROM Products WHERE ProductID = :ID ;");
    query.bindValue(":ID", id);

    if(!query.exec()){
        qDebug() << "Error Executing Query" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        qDebug() << "Query Executed Successfully";
        qDebug() << id ;
        return true;
    }
    return false;
}
