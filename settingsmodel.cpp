#include "settingsmodel.h"
#include <QByteArray>
#include <QDebug>

SettingsModel::SettingsModel(QObject *parent)
    : QAbstractListModel{parent}
{
    m_setting.append(Setting("Mute Setting", false));
}

int SettingsModel::rowCount(const QModelIndex &parent) const
{
    if(parent.isValid())
        return 0;

    return m_setting.count();
}

QVariant SettingsModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid())
        return QVariant();

    const Setting &setting = m_setting.at(index.row());
    if (role == TITLE){
        return setting.title;
    }else if(role == VALUE){
        return setting.value;
    }else{
        return QVariant();
    }
}

QHash<int, QByteArray> SettingsModel::roleNames() const
{
    static QHash<int, QByteArray> mapping {
        {TITLE, "title"},
        {VALUE, "value"}
    };

    return mapping;
}
