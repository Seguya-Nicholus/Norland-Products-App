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
    openDataBase();
//    /* checking if db exists */
//    if(!QFile("~/Norland/Database/" DATABASE_NAME).exists()){
//        this->restoreDataBase();
//    } else {
//        this->openDataBase();
//    }
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
    //    db = QSqlDatabase::addDatabase("QSQLITE");
    //    db.setHostName(DATABASE_HOSTNAME);
    //    db.setDatabaseName("~/Norland/Database/" DATABASE_NAME);
    //    qDebug() << "Database Created Successfully";
    //    if(db.open()){
    //        qDebug() <<"Database Connected Successfully";
    //        return true;

    //    } else {
    //        qDebug() <<"Database Not Connected";
    //        return false;
    //    }

    // === Trial Method Mysql===
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName("63.250.53.146");
    db.setDatabaseName("norland");
    db.setUserName("norland");
    db.setPassword("@Norland2020");
    if(!db.open()){
        qDebug() << "Database Not Connected";
        return false;

    } else {
        qDebug() << "Database Connected Successfully";
        return true;

    }


//    //====================

//    QSqlDatabase laBase = QSqlDatabase::addDataBase("QSQLITE");
//        laBase.setHostName("localhost");
//        laBase.setDataBaseName("test");
//        laBase.setUserName("justin");
//        laBase.setPassword("******");

//        if (!laBase.open()){
//           QMessageBox:: critical (0 /* ... */ );
//           QObject::tr("Error"),
//           laBase.lastError().text());
//           return false;
//        }
//        return true;




}

// Method for restoring Database
bool Database::restoreDataBase()
{
    if(this->openDataBase()){
        qDebug() <<"Database Restored Successfully";
        return (this->createUsersTable() && this->createProductsTable() && this->createMyCartTable() && this->createOrdersTable() && this->createTestimonialsTable() && this->createEventsTable()) ? true : false;

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
                    "Country VARCHAR(30) NOT NULL,"
                    "RefferalCode VARCHAR(30) NOT NULL"
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
                    "Cost REAL NOT NULL"
                    " )"
                    )){
        qDebug() << "DataBase: error of create Products Table" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        qDebug()<<"Products Table Created successfully";

        // Inserting Dummy Products into the Products Table

        insertIntoProductsTable("220001","../../assets/products/product1.png","Vision Vitale","Capsules",150000);
        insertIntoProductsTable("220002","../../assets/products/product2.png","Hypoglycemic","Herbal Capsules",230000);
        insertIntoProductsTable("220003","../../assets/products/product3.png","Immune +","Capsules",250000);
        insertIntoProductsTable("220004","../../assets/products/product4.png","Propolis-Lecmon","Capsules",240000);
        insertIntoProductsTable("220005","../../assets/products/product5.png","Lamberts","Natural Carotene",140000);
        insertIntoProductsTable("220006","../../assets/products/product7.png","Soap","Bathing",100000);
        insertIntoProductsTable("220007","../../assets/products/product8.png","Soap","Skin",100000);
        insertIntoProductsTable("220008","../../assets/products/product9.png","Norland Herbal","Toothpaste",150000);
        insertIntoProductsTable("220009","../../assets/products/product10.png","Men Health","Care Pad",170000);
        insertIntoProductsTable("220010","../../assets/products/product12.png","Kuding","Tea",80000);
        insertIntoProductsTable("220011","../../assets/products/product13.png","Gastrointestinal","Capsules",250000);
        insertIntoProductsTable("220012","../../assets/products/Pad.jpg","Pad","pads",150000);
        insertIntoProductsTable("220013","../../assets/products/Pad2.png","Pad","pads",150000);
        insertIntoProductsTable("220014","../../assets/products/product16.png","Keto Actives","Weight Loss Regimen",120000);
        insertIntoProductsTable("220015","../../assets/products/product17.png","Calcium Iron Zinc","Capsules",200000);
        insertIntoProductsTable("220016","../../assets/products/product18.png","Hypoglycemic","Anti-aging Protein",250000);

        //                insertIntoProductsTable("220017","file:assets/products/product17.png","Hello World","Capsules",150000);
        //        insertIntoProductsTable("../../assets/products/product1.png","Vision Vitale","Capsules","UGX 150,000");
        //        insertIntoProductsTable("../../assets/products/product1.png","Vision Vitale","Capsules","UGX 150,000");
        //        insertIntoProductsTable("../../assets/products/product1.png","Vision Vitale","Capsules","UGX 150,000");

        return true;
    }
    return false;
}

bool Database::createMyCartTable()
{
    QSqlQuery query;
    if(!query.exec( "CREATE TABLE IF NOT EXISTS MyCartTable ("
                    "ProductID VARCHAR(10),"
                    "ImagePath BLOB,"
                    //                    "ImagePath BLOB NOT NULL,"
                    "ProductName VARCHAR(20) NOT NULL,"
                    "ProductText VARCHAR(30) NOT NULL,"
                    "Quantity INTEGER NOT NULL,"
                    "Cost REAL NOT NULL,"
                    "CartTotal  REAL NOT NULL,"
                    "UserID INTEGER NOT NULL"
                    " )"
                    )){
        qDebug() << "DataBase: error of creating MyCartList Table" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        qDebug()<<"MyCartList Table Created successfully";
        return true;
    }
    return false;
}

bool Database::createOrdersTable()
{
    QSqlQuery query;
    if(!query.exec( "CREATE TABLE IF NOT EXISTS Orders ("
                    "OrderID INTEGER NOT NULL,"
                    "ProductID VARCHAR(10),"
                    "ImagePath BLOB,"
                    "ProductName VARCHAR(20) NOT NULL,"
                    "ProductText VARCHAR(30) NOT NULL,"
                    "Quantity INTEGER NOT NULL,"
                    "Cost REAL NOT NULL,"
                    "CartTotal  REAL NOT NULL,"
                    "UserID INTEGER NOT NULL"
                    " )"
                    )){
        qDebug() << "DataBase: error of creating Orders Table" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        qDebug()<<"Orde rs Table Created successfully";
        return true;
    }
    return false;
}

bool Database::createOrdersSummaryTable()
{
    QSqlQuery query;
    if(!query.exec( "CREATE TABLE IF NOT EXISTS OrdersSummary ("
                    "OrderID INTEGER PRIMARY KEY,"
                    "CartTotal  REAL NOT NULL,"
                    "UserID INTEGER NOT NULL"
                    " )"
                    )){
        qDebug() << "DataBase: error of creating OrdersSummary Table" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        qDebug()<<"OrdersSummary Table Created successfully";
        return true;
    }
    return false;
}

bool Database::createTestimonialsTable()
{
    QSqlQuery query;
    if(!query.exec( "CREATE TABLE IF NOT EXISTS Testimonials ("
                    "TestimonialID INTEGER PRIMARY KEY AUTOINCREMENT,"
                    "Username VARCHAR(30) NOT NULL,"
                    "ContentText VARCHAR(2000) NOT NULL,"
                    "Timestamp TEXT NOT NULL"
                    " )"
                    )){
        qDebug() << "DataBase: error of creating Testimonials Table" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        qDebug()<<"Testimonials Table Created successfully";
        return true;
    }
    return false;
}

bool Database::createEventsTable()
{
    QSqlQuery query;
    if(!query.exec( "CREATE TABLE IF NOT EXISTS Events ("
                    "EventID INTEGER PRIMARY KEY AUTOINCREMENT,"
                    "Subject VARCHAR(30) NOT NULL,"
                    "Location VARCHAR(30) NOT NULL,"
                    "StartTime TEXT NOT NULL,"
                    "EndTime TEXT NOT NULL,"
                    "ContentText VARCHAR(50) NOT NULL,"
                    "UserID INTEGER NOT NULL,"
                    "Timestamp TEXT NOT NULL"
                    " )"
                    )){
        qDebug() << "DataBase: error of creating Events Table" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        qDebug()<<"Events Table Created successfully";
        return true;
    }
    return false;

}


// Method for inserting into the Users Table
bool Database::insertIntoUsersTable(QString UserName, QString PhoneNumber, QString Password, QString Country, QString RefferalCode)
{
    QSqlQuery qry;
    qry.prepare("INSERT INTO Users ("
                "Username,"
                "PhoneNumber,"
                "Password,"
                "Country,"
                "RefferalCode)"
                "VALUES(?,?,?,?,?);");

    qry.addBindValue(UserName);
    qry.addBindValue(PhoneNumber);
    qry.addBindValue(Password);
    qry.addBindValue(Country);
    qry.addBindValue(RefferalCode);

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


// Method for inserting into Products Table
bool Database::insertIntoProductsTable(QString ProductID,QByteArray ImagePath, QString ProductName, QString ProductText, double Cost)
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

// Method for inserting  MyCartTable
bool Database::insertIntoMyCartTable(QString ProductID, QByteArray ImagePath, QString ProductName, QString ProductText, int Quantity, double Cost,double CartTotal, int UserId)
{
    QSqlQuery qry;
    qry.prepare("INSERT INTO MyCartTable ("
                "ProductID,"
                "ImagePath,"
                "ProductName,"
                "ProductText,"
                "Quantity,"
                "Cost,"
                "CartTotal,"
                "UserID)"
                "VALUES(?,?,?,?,?,?,?,?);");

    qry.addBindValue(ProductID);
    qry.addBindValue(ImagePath);
    qry.addBindValue(ProductName);
    qry.addBindValue(ProductText);
    qry.addBindValue(Quantity);
    qry.addBindValue(Cost);
    qry.addBindValue(CartTotal);
    qry.addBindValue(UserId);

    if(!qry.exec()){
        qDebug() << "error inserting into MyCart Table " ;
        qDebug() << qry.lastError().text();
        return false;
    } else {

        qDebug()<<"MyCart has been created successfully";
        return true;
    }
    return false;
}

bool Database::insertIntoOrdersTable(int OrderId, QString ProductID, QByteArray ImagePath, QString ProductName, QString ProductText, int Quantity, double Cost, double CartTotal, int UserId)
{
    QSqlQuery qry;
    qry.prepare("INSERT INTO Orders ("
                "OrderID,"
                "ProductID,"
                "ImagePath,"
                "ProductName,"
                "ProductText,"
                "Quantity,"
                "Cost,"
                "CartTotal,"
                "UserID)"
                "VALUES(?,?,?,?,?,?,?,?,?);");

    qry.addBindValue(OrderId);
    qry.addBindValue(ProductID);
    qry.addBindValue(ImagePath);
    qry.addBindValue(ProductName);
    qry.addBindValue(ProductText);
    qry.addBindValue(Quantity);
    qry.addBindValue(Cost);
    qry.addBindValue(CartTotal);
    qry.addBindValue(UserId);

    if(!qry.exec()){
        qDebug() << "error inserting into Orders Table " ;
        qDebug() << qry.lastError().text();
        return false;
    } else {

        qDebug()<<"Order has been created successfully";
        return true;
    }
    return false;
}

bool Database::insertIntoTestimonialTable(QString UserName, QString Messege, QString DatePosted)
{
    QSqlQuery qry;
    qry.prepare("INSERT INTO Testimonials ("
                "Username,"
                "ContentText,"
                "Timestamp)"
                "VALUES(?,?,?);");

    qry.addBindValue(UserName);
    qry.addBindValue(Messege);
    qry.addBindValue(DatePosted);

    if(!qry.exec()){
        qDebug() << "error inserting into Testimonials Table " ;
        qDebug() << qry.lastError().text();
        return false;
    } else {

        qDebug()<<"Testimonial has been created successfully";
        return true;
    }
    return false;
}

bool Database::insertIntoEventsTable(QString SubjectText,QString LocationText,QString StartTimeText,QString EndTimeText,QString Content_Text,int UserId,QString TimeRecordedText)
{
    QSqlQuery qry;
    qry.prepare("INSERT INTO Events ("
                "Subject,"
                "Location,"
                "StartTime,"
                "EndTime,"
                "ContentText,"
                "UserID,"
                "Timestamp)"
                "VALUES(?,?,?,?,?,?,?);");

    qry.addBindValue(SubjectText);
    qry.addBindValue(LocationText);
    qry.addBindValue(StartTimeText);
    qry.addBindValue(EndTimeText);
    qry.addBindValue(Content_Text);
    qry.addBindValue(UserId);
    qry.addBindValue(TimeRecordedText);

    if(!qry.exec()){
        qDebug() << "error inserting into Events Table " ;
        qDebug() << qry.lastError().text();
        return false;
    } else {

        qDebug()<<"Event has been created successfully";
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

int Database::getUserId(QString PhoneNumber, QString Password)
{

    QSqlQuery query("SELECT UserID FROM Users WHERE PhoneNumber= '"+ PhoneNumber +"' AND Password ='" + Password + "'");
    while (query.next()) {
        int UserID = query.value(0).toInt();
        return(UserID);
    }
    return 0;
}

QString Database::getProduuctId(QString ProductName, QString ProductText)
{
    QSqlQuery query("SELECT ProductID FROM MyCartTable WHERE ProductName= '"+ ProductName +"' AND ProductText ='" + ProductText + "'");
    while (query.next()) {
        QString ProductID = query.value(0).toString();
        return(ProductID);
    }
    return 0;
}

int Database::getQuantity(QString ProductId)
{
    QSqlQuery query("SELECT Quantity FROM MyCartTable WHERE ProductID= '" + ProductId + "'");
    while (query.next()) {
        int Quantity = query.value(0).toInt();
        return(Quantity);
    }
    return 0;
}

int Database::getLastOrderId()
{
    QSqlQuery query("SELECT DISTINCT OrderID FROM Orders ORDER BY OrderID DESC limit 1;");
    while (query.next()) {
        int OrderID = query.value(0).toInt();
        return(OrderID);
    }
    return 0;
}

QString Database::getImage(QString ProductId)
{
    QSqlQuery query("SELECT ImagePath FROM Products WHERE ProductID= '" + ProductId + "'");
    while (query.next()) {
        QString ImagePath = query.value(0).toString();
        return(ImagePath);
    }

    qDebug()<<"Error Executing Query";
    return 0;
}

int Database::countCartItems(QString UserId)
{
    QSqlQuery query("SELECT COUNT(ProductID) as ItemCount FROM MyCartTable WHERE UserID= '" + UserId + "'");
    while (query.next()) {
        int ItemCount = query.value(0).toInt();
        return(ItemCount);
    }
    return 0;
}

bool Database::removeCartList()
{
    QSqlQuery qry;
    qry.prepare("DELETE FROM MyCartTable");


    if (qry.exec())
    {
        if (qry.next())
        {
            qDebug()<<"Query Executed Successfully";
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

bool Database::removeCartRecord(QString id)
{
    QSqlQuery query;

    query.prepare("DELETE FROM MyCartTable WHERE ProductID = :ID ;");
    query.bindValue(":ID", id);

    if(!query.exec()){
        qDebug() << "error deleting row  from MyCartTable";
        qDebug() << query.lastError().text();
        return false;
    } else {
        qDebug() << "Query Executed Successfully";
        qDebug() << "Product with Id "<< id <<" has been Deleted Successfully";
        return true;
    }
    return false;
}


// Method to return Product by Id
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
