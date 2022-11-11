#ifndef SETUPMODEL_H
#define SETUPMODEL_H

#include <QObject>

class SetupModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool setting READ setting WRITE setSetting NOTIFY settingChanged)
public:
    explicit SetupModel(QObject *parent = nullptr);

    bool setting() const;
    void setSetting(bool newSetting);

signals:

    void settingChanged();
private:
    bool m_setting;
};

#endif // SETUPMODEL_H
