# init
apt-get update -y
apt-get install -y vim screen git curl wget
apt-get install -y ssh rsync make unzip
ln -sf /vagrant host
mkdir -p git tmp bin src lib

# work env
git clone https://github.com/eaudex/work-env.git git/work-env
rsync -v git/work-env/.bashrc .
rsync -v git/work-env/.screenrc .
rsync -v git/work-env/.pythonrc .
git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
rsync -v git/work-env/.vimrc .

# java
apt-get install -y openjdk-7-jdk
echo '### JAVA HOME' >> .bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre' >> .bashrc

# scala
apt-get install -y scala
apt-get install -y scala-library
#?? echo '### SCALA HOME' >> .bashrc
#?? echo 'export SCALA_HOME=/usr/local/share/scala' >> .bashrc

# python
wget http://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh 2> tmp/anaconda2.log
bash Anaconda2-4.1.1-Linux-x86_64.sh -b -p /home/vagrant/anaconda2
echo '### PYTHON HOME' >> .bashrc
echo 'export PATH=/home/vagrant/anaconda2/bin:$PATH' >> .bashrc
mv Anaconda2-4.1.1-Linux-x86_64.sh bin/

# finalize
chown -R vagrant:vagrant /home/vagrant/
