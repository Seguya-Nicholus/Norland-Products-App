#include "itemmodel.h"
#include "database.h"

ItemModel::ItemModel(QObject *parent) :
     QSqlQueryModel(parent)
{
//    this->updateModel();
}

QVariant ItemModel::data(const QModelIndex &index, int role) const
{
    // Define the column number, on the role of number
    int columnId = role - Qt::UserRole - 1;
    // Create the index using a column ID
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ItemModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[ProductCodeRole] = "ProductID";
    roles[ProductImageRole] = "ImagePath";
    roles[ProductNameRole] = "ProductName";
    roles[ProductTextRole] = "ProductText";
    roles[ProductCostRole] = "Cost";

    return roles;
}

void ItemModel::updateModel(QString id)
{
    this->setQuery("SELECT ImagePath, ProductName, ProductText, Cost FROM Products WHERE ProductID ='" + id +"'");
}
