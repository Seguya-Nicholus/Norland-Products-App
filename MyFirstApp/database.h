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
#define DATABASE_NAME       "Norland.db"


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


public slots:
    bool insertIntoUsersTable(QString UserName,QString PhoneNumber,QString Password,QString Country);
    bool insertIntoProductsTable(QString ProductID,QByteArray ImagePath,QString ProductName,QString ProductText,QString Cost);
    bool loginUser(QString PhoneNumber, QString Password);
    QString  getUsername(QString PhoneNumber, QString Password);
    bool returnProductRecord(const int id); // Returning records from the Products table on its id


signals:

};

#endif // DATABASE_H
