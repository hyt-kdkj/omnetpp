FROM ubuntu:22.04

# タイムゾーン選択をスキップ
ENV DEBIAN_FRONTEND=noninteractive

# 必要なパッケージをインストール
# 必要なパッケージをインストール（キャッシュを無効化）
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    clang \
    gdb \
    bison \
    flex \
    perl \
    python3 \
    python3-pip \
    python3-venv \
    libpython3-dev \
    qtbase5-dev \
    qtchooser \
    qt5-qmake \
    qtbase5-dev-tools \
    libqt5opengl5-dev \
    libxml2-dev \
    zlib1g-dev \
    doxygen \
    graphviz \
    libwebkit2gtk-4.1-0 \
    xdg-utils \
    libdw-dev \
    wget \
    curl \
    git \
    nano \
    vi \
    cmake \
    openmpi-bin \
 && rm -rf /var/lib/apt/lists/* # aptのキャッシュを削除

# Pythonとpipのシンボリックリンク作成
RUN ln -sf /usr/bin/python3 /usr/bin/python && \
    ln -sf /usr/bin/pip3 /usr/bin/pip

# 作業ディレクトリ
WORKDIR /workspace

# Python仮想環境作成
RUN python -m venv venv

# requirements.txt をコピーし仮想環境でインストール
COPY requirements.txt . 
RUN . venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

#READMEをコピー
COPY README.md .

# OMNeT++ のダウンロードと解凍
RUN wget https://github.com/omnetpp/omnetpp/releases/download/omnetpp-6.0.3/omnetpp-6.0.3-linux-x86_64.tgz && \
    tar xvf omnetpp-6.0.3-linux-x86_64.tgz && \
    echo "WITH_QTENV=no" >> /workspace/omnetpp-6.0.3/configure.user && \
    echo "WITH_OSG=no" >> /workspace/omnetpp-6.0.3/configure.user && \
    rm omnetpp-6.0.3-linux-x86_64.tgz

# 起動時に仮想環境を有効化した状態でシェルを開く
CMD ["/bin/bash"]
