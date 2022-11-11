#ifndef MUTESETTING_H
#define MUTESETTING_H
#include <QObject>

class MuteSetting : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool muteSettingValue READ muteSettingValue WRITE setMuteSettingValue NOTIFY muteSettingValueChanged)
public:
    explicit MuteSetting(QObject *parent = nullptr);

    bool muteSettingValue() const;
    void setMuteSettingValue(bool newMuteSettingValue);

signals:

    void muteSettingValueChanged();
private:
    bool m_muteSettingValue;
};

Q_DECLARE_METATYPE(MuteSetting*)

#endif // MUTESETTING_H
