#include "mutesetting.h"

MuteSetting::MuteSetting(QObject *parent)
    : QObject{parent}
    ,m_muteSettingValue(false)
{

}

bool MuteSetting::muteSettingValue() const
{
    return m_muteSettingValue;
}

void MuteSetting::setMuteSettingValue(bool newMuteSettingValue)
{
    if (m_muteSettingValue == newMuteSettingValue)
        return;
    m_muteSettingValue = newMuteSettingValue;
    emit muteSettingValueChanged();
}
