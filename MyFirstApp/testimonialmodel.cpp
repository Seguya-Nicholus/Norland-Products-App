#include "testimonialmodel.h"
#include "database.h"

TestimonialModel::TestimonialModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

// The method for obtaining data from the model
QVariant TestimonialModel::data(const QModelIndex &index, int role) const
{
    // Define the column number, on the role of number
    int columnId = role - Qt::UserRole - 1;
    // Create the index using a column ID
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int, QByteArray> TestimonialModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TestmonialIdRole] = "TestimonialID";
    roles[TestmonialUsernameRole] = "Username";
    roles[TestmonialContentRole] = "ContentText";
    roles[TestmonialTimeStampRole] = "Timestamp";

    return roles;
}

void TestimonialModel::updateModel()
{
    // The update is performed SQL-queries to the database
    this->setQuery("SELECT TestimonialID, Username, ContentText, Timestamp FROM Testimonials");
}
