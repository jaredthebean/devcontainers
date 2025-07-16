FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-24.04

RUN export DEBIAN_FRONTEND=noninteractive \
  # Make sure our Ubuntu has the things needed to support additional apt repositories \
  && apt-get install -y ca-certificates gpg wget \
  # Get Kitware (CMake maker) PPA key  ( https://apt.kitware.com/ for more info ) \
  && wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null \
  # Add Kitware repo to apt sources \
  && echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ noble main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null \
  # Get LLVM (Clang maker) apt repo key ( https://apt.llvm.org/ for more info ) \
  && wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/llvm-archive-keyring.gpg >/dev/null \
  # Add LLVM repo to apt sources \
  && echo 'deb [signed-by=/usr/share/keyrings/llvm-archive-keyring.gpg] http://apt.llvm.org/noble/ llvm-toolchain-noble-19 main' | sudo tee /etc/apt/sources.list.d/llvm.list >/dev/null \
  && echo 'deb-src [signed-by=/usr/share/keyrings/llvm-archive-keyring.gpg] http://apt.llvm.org/noble/ llvm-toolchain-noble-19 main' | sudo tee -a /etc/apt/sources.list.d/llvm.list >/dev/null \
  # Pull down APT and upgrade \
  && apt-get update \
  && apt-get upgrade -y \
  # Should be gotten with upgrade, but ensure CMake is updated to newest stable
  && apt-get install -y \
    cmake \
    clang-19 \
    clang-format-19 \
    clang-tidy-19 \
    lldb-19 \
    llvm-19 \
    llvm-19-runtime \
    python3-pip \
  && apt-get remove -y --autoremove \
    clang \
    clang-format \
    lldb \
    llvm \
    llvm-runtime \
  && ln -s /bin/clang-19 /bin/clang \
  && ln -s /bin/clang-format-19 /bin/clang-format \
  && ln -s /bin/lldb-19 /bin/lldb \
  && ln -s /usr/bin/clang-tidy-19 /usr/bin/clang-tidy \
  && python3 -m pip install --break-system-packages pre-commit \
  # Support X11 Forwarding (specifically have xauth so X/GUI client
  # apps can read the mounted/forwarded Xauthority file and parrot 
  # back the secret token it contains to the X Server controlling the
  # host display (monitors, keyboards, mouse, etc.)
  && apt-get install -y xauth


# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
