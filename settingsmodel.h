#ifndef SETTINGSMODEL_H
#define SETTINGSMODEL_H

#include <QAbstractListModel>

struct Setting{
    Setting(){}
    Setting(const QString& title, bool value)
        :title(title), value(value){}
    QString title;
    bool value;
};

class SettingsModel : public QAbstractListModel
{
public:
    enum RoleName{
        TITLE = Qt::UserRole,
        VALUE
    };

    explicit SettingsModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    QVector<Setting> m_setting;
};


#endif // SETTINGSMODEL_H
