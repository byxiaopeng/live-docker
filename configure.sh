cd /etc/ct
git clone https://github.com/Davenchy/live-torrent
cd /etc/ct/live-torrent
#安装依赖
npm i
#打包运行
npm run build
nohup npm start&
