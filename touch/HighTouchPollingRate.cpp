/*
 * SPDX-FileCopyrightText: The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "HighTouchPollingRateService"

#include "HighTouchPollingRate.h"

#include <fstream>

namespace vendor {
namespace lineage {
namespace touch {
namespace V1_0 {
namespace implementation {

const std::string kInterpolationPath = "/sys/class/touchscreen/primary/interpolation";

Return<bool> HighTouchPollingRate::isEnabled() {
    std::ifstream file(kInterpolationPath);
    int enabled;
    file >> enabled;

    if(enabled == 1)
        return true;

    return false;
}

Return<bool> HighTouchPollingRate::setEnabled(bool enabled) {
    std::ofstream file(kInterpolationPath);
    file << (enabled ? "1" : "0");
    return !file.fail();
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace touch
}  // namespace lineage
}  // namespace vendor
