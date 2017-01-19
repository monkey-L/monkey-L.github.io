#install
echo "================ install hexo ==================="
npm install hexo-cli -g

echo "================= init hexo ======================"
npm install

# rss
echo "================ install rss ====================="
npm install hexo-generator-feed --save

# google search
echo "============ install google search ==============="
npm install hexo-generator-sitemap --save

# baidu search
echo "============= install baidu search ==============="
npm install hexo-generator-baidu-sitemap --save

echo "=============== install finished! ================"