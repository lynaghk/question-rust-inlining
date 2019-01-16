##install.packages("tidyverse")
library(tidyverse)

# I "imported" this data from the benchmark output via emacs.
d = tribble(
    ~task             , ~f       , ~is_inline  , ~n , ~v_lower , ~v     , ~v_upper ,
    "sum"             ,"match"   ,"not inline" ,2   , 20.174   , 20.595 , 21.012   ,
    "mix"             ,"match"   ,"not inline" ,2   , 92.186   , 94.599 , 97.557   ,
    "mix with rotate" ,"match"   ,"not inline" ,2   , 124.78   , 131.61 , 140.11   ,
    "sum"             ,"lookup"  ,"not inline" ,2   , 26.843   , 27.444 , 28.030   ,
    "mix"             ,"lookup"  ,"not inline" ,2   , 110.13   , 112.66 , 115.28   ,
    "mix with rotate" ,"lookup"  ,"not inline" ,2   , 151.17   , 155.44 , 159.99   ,
    "sum"             ,"match"   ,"not inline" ,4   , 21.268   , 21.714 , 22.169   ,
    "mix"             ,"match"   ,"not inline" ,4   , 101.07   , 103.04 , 105.12   ,
    "mix with rotate" ,"match"   ,"not inline" ,4   , 109.04   , 112.38 , 116.12   ,
    "sum"             ,"lookup"  ,"not inline" ,4   , 25.457   , 26.190 , 27.038   ,
    "mix"             ,"lookup"  ,"not inline" ,4   , 113.93   , 116.59 , 119.15   ,
    "mix with rotate" ,"lookup"  ,"not inline" ,4   , 150.46   , 154.69 , 159.85   ,
    "sum"             ,"match"   ,"not inline" ,8   , 21.392   , 21.725 , 22.051   ,
    "mix"             ,"match"   ,"not inline" ,8   , 96.052   , 97.718 , 99.497   ,
    "mix with rotate" ,"match"   ,"not inline" ,8   , 113.81   , 116.05 , 118.36   ,
    "sum"             ,"lookup"  ,"not inline" ,8   , 25.335   , 26.217 , 27.329   ,
    "mix"             ,"lookup"  ,"not inline" ,8   , 111.92   , 114.80 , 118.12   ,
    "mix with rotate" ,"lookup"  ,"not inline" ,8   , 134.41   , 136.65 , 139.20   ,
    "sum"             ,"lookup"  ,"inline"     ,2   , 11.336   , 11.680 , 12.022   ,
    "sum"             ,"match"   ,"inline"     ,2   , 9.0151   , 9.2310 , 9.4567   ,
    "mix"             ,"match"   ,"inline"     ,2   , 58.079   , 59.609 , 61.105   ,
    "mix with rotate" ,"match"   ,"inline"     ,2   , 86.957   , 88.770 , 90.824   ,
    "mix"             ,"lookup"  ,"inline"     ,2   , 56.118   , 57.437 , 58.794   ,
    "mix with rotate" ,"lookup"  ,"inline"     ,2   , 93.646   , 95.967 , 98.493   ,
    "sum"             ,"lookup"  ,"inline"     ,4   , 11.380   , 11.658 , 11.924   ,
    "sum"             ,"match"   ,"inline"     ,4   , 8.0766   , 8.3090 , 8.5368   ,
    "mix"             ,"match"   ,"inline"     ,4   , 58.897   , 60.279 , 61.621   ,
    "mix with rotate" ,"match"   ,"inline"     ,4   , 133.21   , 136.25 , 139.26   ,
    "mix"             ,"lookup"  ,"inline"     ,4   , 56.689   , 57.855 , 59.153   ,
    "mix with rotate" ,"lookup"  ,"inline"     ,4   , 91.077   , 92.860 , 94.710   ,
    "sum"             ,"lookup"  ,"inline"     ,8   , 10.955   , 11.225 , 11.484   ,
    "sum"             ,"match"   ,"inline"     ,8   , 8.9258   , 9.3765 , 9.9122   ,
    "mix"             ,"match"   ,"inline"     ,8   , 65.588   , 70.036 , 75.024   ,
    "mix with rotate" ,"match"   ,"inline"     ,8   , 125.11   , 128.35 , 132.15   ,
    "mix"             ,"lookup"  ,"inline"     ,8   , 63.473   , 66.695 , 70.924   ,
    "mix with rotate" ,"lookup"  ,"inline"     ,8   , 94.429   , 96.936 , 99.785
    
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
