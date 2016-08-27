# init
apt-get update -y
apt-get install -y vim screen git curl wget
apt-get install -y ssh rsync make unzip
apt-get install -y maven2
ln -sf /vagrant host
ln -sf /vagrant/git git
mkdir -p tmp bin src lib

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
#apt-get install -y scala
#apt-get install -y scala-library
wget http://downloads.lightbend.com/scala/2.10.6/scala-2.10.6.tgz 2> tmp/scala.log
tar xvzf scala-2.10.6.tgz -C /usr/local/share/
mv scala-2.10.6.tgz src/
ln -sf /usr/local/share/scala-2.10.6 /usr/local/share/scala
echo '### SCALA HOME' >> .bashrc
echo 'export SCALA_HOME=/usr/local/share/scala' >> .bashrc
echo 'export PATH=/usr/local/share/scala/bin:$PATH' >> .bashrc

# python
wget http://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh 2> tmp/anaconda2.log
bash Anaconda2-4.1.1-Linux-x86_64.sh -b -p /usr/local/share/anaconda2
mv Anaconda2-4.1.1-Linux-x86_64.sh bin/
echo '### PYTHON HOME' >> .bashrc
echo 'export PATH=/usr/local/share/anaconda2/bin:$PATH' >> .bashrc

# finalize
chown -R vagrant:vagrant /home/vagrant/
