yuzu emulator early access
=============

This is the source code for early-access 4176.

## Legal Notice

yuzu is a GPLv3 program, which allows fully free redistribution of its source code and releases liability of it's authors for how this software is used as stated in Section 15 and 16.

The yuzu Emulator program does not circumvent Nintendo's technological protection measures (TPMs) as the user is required to provide both the Nintendo Switch software & the encryption keys for these games, and the yuzu Emulator uses a mode of the Advanced Encryption Standard (AES), an open encryption standard established by the US NIST, along with the encryption keys that the user themselves must lawfully acquire, to decrypt the software. <br>As the standard is public and available to use by all, it does not constitute as the Digital Market Copyright Act's (DMCA) definition of "circumventing a technological measure" as defined in Section 1201(a)(3).

The yuzu Emulator also falls under the exemptions stated in Section 1201(f) of the DMCA as this software was created for the purposes of reverse engineering the Nintendo Switch software (known as Horizon OS) to create interoperability with Nintendo Switch games and software with the Windows, macOS, and GNU/Linux operating systems.

## macOS
/Applications/CLion.app/Contents/bin/cmake/mac/aarch64/bin/cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_MAKE_PROGRAM=/Applications/CLion.app/Contents/bin/ninja/mac/aarch64/ninja -DYUZU_USE_BUNDLED_VCPKG:BOOL=ON -DCMAKE_OSX_ARCHITECTURES=arm64 -DVCPKG_TARGET_TRIPLET=arm64-osx -DYUZU_USE_BUNDLED_QT:BOOL=OFF -DENABLE_QT6:BOOL=ON -DYUZU_USE_BUNDLED_FFMPEG:BOOL=ON -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DENABLE_QT_TRANSLATION=ON -G Ninja -S ~/ns -B ~/ns/cmake-build-debug

# 1. 设置路径
LLVM_PATH="/opt/homebrew/opt/llvm@18/bin"

# 2. 配置 (显式加入 -Wno-deprecated-declarations 以减少 Qt 6.9 的警告干扰)
cmake -G Ninja \
  -S . -B build \
  -DCMAKE_C_COMPILER="/usr/bin/clang" \
  -DCMAKE_CXX_COMPILER="/usr/bin/clang++" \
  -DCMAKE_BUILD_TYPE=Release \
  -DYUZU_USE_BUNDLED_VCPKG=ON \
  -DVCPKG_TARGET_TRIPLET=arm64-osx \
  -DENABLE_QT6=ON \
  -DYUZU_USE_BUNDLED_QT=OFF \
  -DCMAKE_OSX_DEPLOYMENT_TARGET="26.0" \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
  -DCMAKE_CXX_FLAGS="-Wno-elaborated-enum-base -Wno-deprecated-declarations" \
  -DCMAKE_EXE_LINKER_FLAGS="-Wl,-framework,VideoToolbox -Wl,-framework,CoreFoundation -Wl,-framework,CoreMedia -Wl,-framework,AudioToolbox -Wl,-framework,AVFoundation -Wl,-framework,AppKit -Wl,-framework,QuartzCore"

# 3. 编译
ninja -C ~/ns/build