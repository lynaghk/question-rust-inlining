##install.packages("tidyverse")
library(tidyverse)

# I "imported" this data from the benchmark output via emacs.
d = tribble(
    ~task        , ~f      , ~is_inline , ~n , ~v_lower , ~v     , ~v_upper ,
    
    ## rustc 1.31.1 (b6c32da9b 2018-12-18)
    "sum"        ,"match"  ,FALSE       ,2   , 16.243   , 16.407 , 16.601   ,
    "mix"        ,"match"  ,FALSE       ,2   , 75.397   , 75.974 , 76.628   ,
    "mix rotate" ,"match"  ,FALSE       ,2   , 108.87   , 109.98 , 111.14   ,
    "sum"        ,"lookup" ,FALSE       ,2   , 18.349   , 18.498 , 18.673   ,
    "mix"        ,"lookup" ,FALSE       ,2   , 75.035   , 75.791 , 76.653   ,
    "mix rotate" ,"lookup" ,FALSE       ,2   , 98.692   , 99.878 , 101.23   ,
    "sum"        ,"match"  ,FALSE       ,4   , 18.380   , 18.598 , 18.840   ,
    "mix"        ,"match"  ,FALSE       ,4   , 80.316   , 81.651 , 83.101   ,
    "mix rotate" ,"match"  ,FALSE       ,4   , 98.826   , 99.735 , 100.68   ,
    "sum"        ,"lookup" ,FALSE       ,4   , 18.323   , 18.508 , 18.707   ,
    "mix"        ,"lookup" ,FALSE       ,4   , 75.346   , 76.264 , 77.369   ,
    "mix rotate" ,"lookup" ,FALSE       ,4   , 99.471   , 100.72 , 102.03   ,
    "sum"        ,"match"  ,FALSE       ,8   , 18.414   , 18.599 , 18.795   ,
    "mix"        ,"match"  ,FALSE       ,8   , 76.165   , 77.078 , 78.080   ,
    "mix rotate" ,"match"  ,FALSE       ,8   , 106.76   , 107.52 , 108.38   ,
    "sum"        ,"lookup" ,FALSE       ,8   , 18.306   , 18.444 , 18.598   ,
    "mix"        ,"lookup" ,FALSE       ,8   , 75.546   , 76.542 , 77.652   ,
    "mix rotate" ,"lookup" ,FALSE       ,8   , 98.814   , 100.01 , 101.33   ,
    "sum"        ,"lookup" ,TRUE        ,2   , 3.1640   , 3.1895 , 3.2181   ,
    "sum"        ,"match"  ,TRUE        ,2   , 7.8750   , 7.9657 , 8.0618   ,
    "mix"        ,"match"  ,TRUE        ,2   , 53.822   , 54.358 , 54.937   ,
    "mix rotate" ,"match"  ,TRUE        ,2   , 110.25   , 111.52 , 113.07   ,
    "mix"        ,"lookup" ,TRUE        ,2   , 33.931   , 34.277 , 34.664   ,
    "mix rotate" ,"lookup" ,TRUE        ,2   , 63.521   , 64.840 , 66.583   ,
    "sum"        ,"lookup" ,TRUE        ,4   , 3.1764   , 3.2077 , 3.2435   ,
    "sum"        ,"match"  ,TRUE        ,4   , 7.3389   , 7.4401 , 7.5533   ,
    "mix"        ,"match"  ,TRUE        ,4   , 53.561   , 54.181 , 54.845   ,
    "mix rotate" ,"match"  ,TRUE        ,4   , 109.82   , 110.65 , 111.55   ,
    "mix"        ,"lookup" ,TRUE        ,4   , 33.618   , 34.037 , 34.591   ,
    "mix rotate" ,"lookup" ,TRUE        ,4   , 62.356   , 62.961 , 63.720   ,
    "sum"        ,"lookup" ,TRUE        ,8   , 3.1986   , 3.2334 , 3.2713   ,
    "sum"        ,"match"  ,TRUE        ,8   , 7.3258   , 7.4137 , 7.5058   ,
    "mix"        ,"match"  ,TRUE        ,8   , 53.295   , 53.788 , 54.322   ,
    "mix rotate" ,"match"  ,TRUE        ,8   , 111.32   , 112.71 , 114.33   ,
    "mix"        ,"lookup" ,TRUE        ,8   , 34.309   , 34.774 , 35.293   ,
    "mix rotate" ,"lookup" ,TRUE        ,8   , 62.776   , 63.483 , 64.254



    
    
) %>% mutate(task = factor(task, levels = c("sum", "mix", "mix rotate"))
           , f = factor(f)
           , n = factor(n))


ggplot(d, aes(n, v
              , group = interaction(task, is_inline, f)
              , color = f
              , linetype = is_inline
              )) +
    geom_errorbar(aes(ymin=v_lower, ymax=v_upper), colour="black", width=.1) +

    geom_point() +
    geom_line() +
    
    facet_grid(. ~ task, scales = "free_y") +
    labs(title = ""
       , x = "alphabet size"
       , y = "iteration time (us)")


#ggsave("plot.png")
