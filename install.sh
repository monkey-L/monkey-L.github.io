#install
echo "================ installing hexo ================"
npm install hexo-cli -g

echo "================ init ================"
npm install hexo --save
npc install

#deploy
echo "================ installing deployer ================"
npm install hexo-deployer-git --save

#search
echo "================ installing search ================"
npm install hexo-generator-search --save

# rss
echo "================ installing rss ================"
npm install hexo-generator-feed --save

echo "================ install finished! ================"