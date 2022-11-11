#include "setupmodel.h"

SetupModel::SetupModel(QObject *parent)
    : QObject{parent}
{

}

bool SetupModel::setting() const
{
    return m_setting;
}

void SetupModel::setSetting(bool newSetting)
{
    if (m_setting == newSetting)
        return;
    m_setting = newSetting;
    emit settingChanged();
}
