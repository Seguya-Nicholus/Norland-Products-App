#include "mycartmodel.h"
#include "database.h"

MyCartModel::MyCartModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

QVariant MyCartModel::data(const QModelIndex &index, int role) const
{
    // Define the column number, on the role of number
    int columnId = role - Qt::UserRole - 1;
    // Create the index using a column ID
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> MyCartModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[ProductCodeRole] = "ProductID";
    roles[ProductImageRole] = "ImagePath";
    roles[ProductNameRole] = "ProductName";
    roles[ProductTextRole] = "ProductText";
    roles[ProductQuantityRole] = "Quantity";
    roles[ProductCostRole] = "Cost";
    roles[CartTotalRole] = "CartTotal";
    roles[UserIdRole] = "UserID";

    return roles;
}

void MyCartModel::updateModel()
{
    // The update is performed SQL-queries to the database
    this->setQuery("SELECT ProductID, ImagePath, ProductName, ProductText,Quantity, Cost, CartTotal , UserID FROM MyCartTable");

}

int MyCartModel::getProductId(int row)
{
 return this->data(this->index(row, 0), ProductCodeRole).toInt();
}
