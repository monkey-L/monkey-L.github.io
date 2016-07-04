#install
echo "================ installing hexo ================"
npm install hexo-cli -g

echo "================ init ================"
npc install

# rss
echo "================ installing rss ================"
npm install hexo-generator-feed --save

echo "================ install finished! ================"