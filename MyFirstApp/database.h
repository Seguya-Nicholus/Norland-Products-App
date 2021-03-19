#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>
#include <string>
#include <iostream>
#include <cstdlib>

#define DATABASE_HOSTNAME   "NorlandDataBase"
//#define DATABASE_NAME       "Norland.db"
#define DATABASE_NAME       "sql2370281"


class Database : public QObject
{
    Q_OBJECT
public:
    //    explicit Database(QObject *parent = nullptr);
    explicit Database(QObject *parent = 0);
    ~Database();
    void connectToDataBase();
    void createDbPath();

private:
    QSqlDatabase   db;

private:
    bool openDataBase();
    bool restoreDataBase();
    void closeDataBase();
    bool createUsersTable();
    bool createProductsTable();
    bool createMyCartTable();
    bool createOrdersTable();
    bool createOrdersSummaryTable();
    bool createTestimonialsTable();
    bool createEventsTable();


public slots:
    bool insertIntoUsersTable(QString UserName,QString PhoneNumber,QString Password,QString Country,QString RefferalCode);
    bool insertIntoProductsTable(QString ProductID,QByteArray ImagePath,QString ProductName,QString ProductText,double Cost);
    bool insertIntoMyCartTable(QString ProductID,QByteArray ImagePath,QString ProductName,QString ProductText, int Quantity, double Cost,double CartTotal, int UserId);
    bool insertIntoOrdersTable(int OrderId,QString ProductID,QByteArray ImagePath,QString ProductName,QString ProductText, int Quantity, double Cost,double CartTotal, int UserId);
    bool insertIntoTestimonialTable(QString UserName,QString Messege,QString DatePosted);
    bool insertIntoEventsTable(QString SubjectText,QString LocationText,QString StartTimeText,QString EndTimeText,QString Content_Text,int UserId,QString TimeRecordedText);
    bool loginUser(QString PhoneNumber, QString Password);
    QString  getUsername(QString PhoneNumber, QString Password);
    int getUserId(QString PhoneNumber, QString Password);
    QString getProduuctId(QString ProductName,QString ProductText);
    int getQuantity(QString ProductId);
    int getLastOrderId();
    QString getImage(QString ProductId);
    int countCartItems(QString UserId);
    bool removeCartList();
    bool removeCartRecord(QString id); // Removing records from the Cart on its id
    bool returnProductRecord(const int id); // Returning records from the Products table on its id



signals:

};

#endif // DATABASE_H
