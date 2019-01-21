##install.packages("tidyverse")
library(tidyverse)

# I "imported" this data from the benchmark output via emacs.
d = tribble(
    ~task             , ~f      , ~is_inline  , ~n , ~v_lower , ~v     , ~v_upper ,
    "sum"             ,"match"  ,"not inline" ,2   , 19.752   , 20.207 , 20.780   ,
    "mix"             ,"match"  ,"not inline" ,2   , 87.161   , 88.192 , 89.239   ,
    "mix with rotate" ,"match"  ,"not inline" ,2   , 92.997   , 94.053 , 95.211   ,
    "sum"             ,"lookup" ,"not inline" ,2   , 23.311   , 23.727 , 24.183   ,
    "mix"             ,"lookup" ,"not inline" ,2   , 97.522   , 98.905 , 100.46   ,
    "mix with rotate" ,"lookup" ,"not inline" ,2   , 112.45   , 114.58 , 117.27   ,
    "sum"             ,"match"  ,"not inline" ,4   , 18.941   , 19.167 , 19.401   ,
    "mix"             ,"match"  ,"not inline" ,4   , 90.858   , 92.001 , 93.257   ,
    "mix with rotate" ,"match"  ,"not inline" ,4   , 89.939   , 91.152 , 92.398   ,
    "sum"             ,"lookup" ,"not inline" ,4   , 22.309   , 22.610 , 22.942   ,
    "mix"             ,"lookup" ,"not inline" ,4   , 96.845   , 97.876 , 99.013   ,
    "mix with rotate" ,"lookup" ,"not inline" ,4   , 113.15   , 114.51 , 115.97   ,
    "sum"             ,"match"  ,"not inline" ,8   , 18.955   , 19.242 , 19.568   ,
    "mix"             ,"match"  ,"not inline" ,8   , 90.184   , 91.269 , 92.419   ,
    "mix with rotate" ,"match"  ,"not inline" ,8   , 90.291   , 91.211 , 92.133   ,
    "sum"             ,"lookup" ,"not inline" ,8   , 22.041   , 22.557 , 23.305   ,
    "mix"             ,"lookup" ,"not inline" ,8   , 97.027   , 97.918 , 98.864   ,
    "mix with rotate" ,"lookup" ,"not inline" ,8   , 110.73   , 111.97 , 113.27   ,
    "sum"             ,"lookup" ,"inline"     ,2   , 9.9589   , 10.115 , 10.296   ,
    "sum"             ,"match"  ,"inline"     ,2   , 0.0000   , 0.0000 , 0.0000   ,
    "mix"             ,"match"  ,"inline"     ,2   , 50.704   , 51.331 , 52.031   ,
    "mix with rotate" ,"match"  ,"inline"     ,2   , 62.849   , 63.510 , 64.178   ,
    "mix"             ,"lookup" ,"inline"     ,2   , 52.181   , 52.727 , 53.314   ,
    "mix with rotate" ,"lookup" ,"inline"     ,2   , 63.455   , 64.292 , 65.206   ,
    "sum"             ,"lookup" ,"inline"     ,4   , 9.7954   , 9.8957 , 10.008   ,
    "sum"             ,"match"  ,"inline"     ,4   , 7.4516   , 7.7460 , 8.1092   ,
    "mix"             ,"match"  ,"inline"     ,4   , 52.345   , 53.138 , 54.018   ,
    "mix with rotate" ,"match"  ,"inline"     ,4   , 62.313   , 62.855 , 63.405   ,
    "mix"             ,"lookup" ,"inline"     ,4   , 52.487   , 53.182 , 53.922   ,
    "mix with rotate" ,"lookup" ,"inline"     ,4   , 63.917   , 64.823 , 65.791   ,
    "sum"             ,"lookup" ,"inline"     ,8   , 9.8150   , 9.9389 , 10.081   ,
    "sum"             ,"match"  ,"inline"     ,8   , 7.4273   , 7.5272 , 7.6310   ,
    "mix"             ,"match"  ,"inline"     ,8   , 52.257   , 52.895 , 53.582   ,
    "mix with rotate" ,"match"  ,"inline"     ,8   , 61.617   , 62.514 , 63.599   ,
    "mix"             ,"lookup" ,"inline"     ,8   , 52.400   , 53.002 , 53.616   ,
    "mix with rotate" ,"lookup" ,"inline"     ,8   , 62.592   , 63.247 , 63.925
    
) %>% mutate(task = factor(task, levels = c("sum", "mix", "mix with rotate"))
           , f = factor(f)
           , n = factor(n)
           , is_inline = is_inline == "inline")


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
