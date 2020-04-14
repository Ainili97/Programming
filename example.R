# 載入套件
library(ggmap)
library(ggplot2)
library(jsonlite)
library(gganimate)
library(viridis)


# 設定API KEY
register_google(key = "AIzaSyBBc7N-wLvVrBlKa2JhC8BEaUU2CBH_PFk")


# 讀取資料(json to data.frame)
tourist <- jsonlite::fromJSON("http://210.69.40.35/api/api/Tourists")


# 整理地名以搜尋正確地點
q <- c()
for (locat in tourist$ScenicSpot){
  if (grepl("_", locat)) {
    query <- strsplit(locat, "_")[[1]][2]
  }
  else query <- locat
  query <- gsub("[◎]", "", query)
  q <- c(q, query)
}
tourist$query <- q


# 找出每個地點的經緯度並紀錄
locations <- unique(tourist$query)
df <- data.frame(location = locations, stringsAsFactors = FALSE)
df <- mutate_geocode(df, location)


# 將經緯資料整合回原本的資料集
tourist$lon <- as.numeric(lapply(tourist$query, function(x)df[which(df$location == x),]$lon))
tourist$lat <- as.numeric(lapply(tourist$query, function(x)df[which(df$location == x),]$lat))


# 將日期由"101年1月"的格式改為第1至77個月(較容易作animate)
trans_month <- function(x){
  t <- as.numeric(strsplit(gsub("[月]", "", x), "年")[[1]])
  i_th <- (t[1]-101)*12 + t[2]
  return(i_th)
}
tourist$month <- as.integer(lapply(tourist$StatsMonth, trans_month))


# 下載適合的地圖
map <- get_googlemap(c(120.32, 23.17), maptype = "roadmap", language = "zh-TW", color = 'bw')


# 作圖
map_plot <- ggmap(map) +
  geom_point(data = tourist,
             aes(x = lon,
                 y = lat,
                 size = Visitors,
                 color=Visitors,
                 group = query),
             alpha = .5) +
  scale_size_continuous(range = c(2, 20)) +
  scale_color_viridis(option="C", trans="log") +
  transition_components(month) +
  labs(title = "Month: {frame_time}")


# 展示
animate(map_plot, height = 800, width = 800, nframes = 77, fps=5)
