#include "productsmodel.h"
#include "database.h"

ProductsModel::ProductsModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}


// The method for obtaining data from the model
QVariant ProductsModel::data(const QModelIndex &index, int role) const
{
    // Define the column number, on the role of number
    int columnId = role - Qt::UserRole - 1;
    // Create the index using a column ID
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> ProductsModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[ProductCodeRole] = "ProductID";
    roles[ProductImageRole] = "ImagePath";
    roles[ProductNameRole] = "ProductName";
    roles[ProductTextRole] = "ProductText";
    roles[ProductCostRole] = "Cost";

    return roles;

}


// The method updates the tables in the data model representation
void ProductsModel::updateModel()
{

    // The update is performed SQL-queries to the database
    this->setQuery("SELECT ProductID, ImagePath, ProductName, ProductText, Cost FROM Products");

}

// Method to pick a particular Product
int ProductsModel::getProductId(int row)
{
     return this->data(this->index(row, 0), ProductCodeRole).toInt();


}
