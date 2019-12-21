library(rdbhapi)
library(tidyverse)


tib = select(dbh_data(308, filters = list("Årstall"=2018, "Emnekode"="ING101-1", "Semester"=1,  "Institusjonskode"="0238"), 
		      group_by = "Karakter"), -c("Antall kandidater kvinner", "Antall kandidater menn"))

df <- as.data.frame(tib)
df

names(df) = c("Karakter", "Antall")

max = max(select(df, c("Antall")))
step = round(max/4)

p <- ggplot(data = df, aes(x=Karakter, 
			   y=Antall)) + 
geom_hline(yintercept=seq(0, max + step, by=step), size=0.2) + 
geom_bar(stat="identity", fill="#038700", width=0.5, color="black", size=0.1) + 
theme(axis.title.x = element_blank(), axis.title.y = element_blank(), 
      panel.grid.major.x = element_blank(),
      axis.ticks = element_blank(),
      panel.background = element_blank()) +
scale_y_continuous(breaks = seq(0, max + step, step)) +
geom_text(aes(label=Antall), vjust=1.7, color="#FFFFFF")  

ggsave("file.pdf", width=7, height=7)

