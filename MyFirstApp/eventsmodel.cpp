#include "eventsmodel.h"
#include "database.h"

EventsModel::EventsModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}

QVariant EventsModel::data(const QModelIndex &index, int role) const
{
    // Define the column number, on the role of number
    int columnId = role - Qt::UserRole - 1;
    // Create the index using a column ID
    QModelIndex modelIndex = this->index(index.row(), columnId);

    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);

}

QHash<int, QByteArray> EventsModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[EventIdRole] = "EventID";
    roles[EventtSubjectRole] = "Subject";
    roles[EventLocationRole] = "Location";
    roles[EventStartTimeRole] = "StartTime";
    roles[EventEndTimeRole] = "EndTime";
    roles[EventContentTextRole] = "ContentText";
    roles[EventUserIDRole] = "UserID";
    roles[EventTimestampRole] = "Timestamp";

    return roles;

}

void EventsModel::updateModel()
{
    // The update is performed SQL-queries to the database
    this->setQuery("SELECT EventID, Subject, Location, StartTime, EndTime,ContentText,UserID,Timestamp FROM Events ");


}
