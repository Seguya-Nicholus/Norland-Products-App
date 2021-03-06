#ifndef MYCARTMODEL_H
#define MYCARTMODEL_H

#include <QObject>
#include <QSqlQueryModel>


class MyCartModel : public QSqlQueryModel
{
    Q_OBJECT
public:

    /* We list all the roles that will be used in the TableView.
     * As you can see, they have to be in the memory above the parameter Qt::UserRole.
     * Due to the fact that the information below this address is not for customizations
     * */
    enum Roles {
        ProductCodeRole = Qt::UserRole + 1 ,            // code
        ProductImageRole,             // Image
        ProductNameRole,      // Name
        ProductTextRole,          // Text
        ProductQuantityRole,
        ProductCostRole,
        CartTotalRole,
        UserIdRole
    };


    explicit MyCartModel(QObject *parent = nullptr);

    // Override the method that will return the data
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;

protected:
    /* hashed table of roles for speakers.
     * The method used in the wilds of the base class QAbstractItemModel,
     * from which inherits the class QSqlQueryModel
     * */
    QHash<int, QByteArray> roleNames() const;

signals:

public slots:
    void updateModel();
    int getProductId(int row);

};

#endif // MYCARTMODEL_H
