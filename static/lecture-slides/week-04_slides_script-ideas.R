library(ggtext)
library(ggrepel)

# FIXME: ssss

bechdel %>%
  drop_na(budget_2013) %>%
  ggplot(aes(x = budget_2013,
             y = domgross_2013,
             fill = ifelse(year > 2000, "Post-2020", "Pre-2020"))) +
  geom_point(show.legend = FALSE,
             shape = 21,
             size = 3,
             stroke = 0.2) +
  scale_y_continuous(labels = scales::label_number(scale = 1E-6,
                                                   suffix = " Million",
                                                   big.mark = ",",
                                                   prefix = "$")) +
  scale_x_continuous(labels = scales::label_number(scale = 1E-6,
                                                   suffix = " Million",
                                                   big.mark = ",",
                                                   prefix = "$")) +
  scale_fill_manual(values = c("Pre-2020" = "burlywood", "Post-2020" = "cornflowerblue")) +

  labs(y = "Movie Domestic Gross",
       x = "Movie Budget",
       title = "Profitability of <span style='color:burlywood;font-weight:bold'>pre-2020</span> and <span style='color:cornflowerblue;font-weight:bold'>post-2020 movies</span>",
       subtitle = "Data source: fivethirtyeight::bechdel") +
  theme_bw(base_size = 16) +
  theme(plot.title = element_markdown())


set.seed(2)
bechdel %>%
  drop_na(budget_2013) %>%
  ggplot(aes(x = budget_2013,
             y = domgross_2013,
             fill = ifelse(year > 2000, "Post-2020", "Pre-2020"))) +
  geom_label_repel(aes(label = ifelse(domgross_2013 > 1E9 | budget_2013 > 4E8, title, "")),
                   show.legend = FALSE,
                   force = 40) +
  geom_point(show.legend = FALSE,
             shape = 21,
             size = 3,
             stroke = 0.2) +
  scale_y_continuous(labels = scales::label_number(scale = 1E-6,
                                                   suffix = " Million",
                                                   big.mark = ",",
                                                   prefix = "$")) +
  scale_x_continuous(labels = scales::label_number(scale = 1E-6,
                                                   suffix = " Million",
                                                   big.mark = ",",
                                                   prefix = "$")) +
  scale_fill_manual(values = c("Pre-2020" = "burlywood", "Post-2020" = "cornflowerblue")) +
  labs(y = "Movie Domestic Gross",
       x = "Movie Budget",
       title = "Profitability of <span style='color:burlywood;font-weight:bold'>pre-2020</span> and <span style='color:cornflowerblue;font-weight:bold'>post-2020 movies</span>",
       subtitle = "Data source: fivethirtyeight::bechdel") +
  theme_bw(base_size = 16) +
  theme(plot.title = element_markdown())

library(plotly)

gg_bechdel_for_plotly <- bechdel %>%
  drop_na(budget_2013) %>%
  ggplot(aes(x = budget_2013,
             y = domgross_2013,
             fill = ifelse(year > 2000, "Post-2020", "Pre-2020"))) +
  geom_point(show.legend = FALSE,
             shape = 21,
             size = 3,
             stroke = 0.2) +
  scale_y_continuous(labels = scales::label_number(scale = 1E-6,
                                                   suffix = " Million",
                                                   big.mark = ",",
                                                   prefix = "$")) +
  scale_x_continuous(labels = scales::label_number(scale = 1E-6,
                                                   suffix = " Million",
                                                   big.mark = ",",
                                                   prefix = "$")) +
  scale_fill_manual(values = c("Pre-2020" = "burlywood", "Post-2020" = "cornflowerblue")) +
  guides(fill = guide_none()) +
  labs(y = "Movie Domestic Gross",
       x = "Movie Budget",
       title = "Profitability of <span style='color:burlywood;font-weight:bold'>pre-2020</span> and <span style='color:cornflowerblue;font-weight:bold'>post-2020 movies</span>",
       subtitle = "Data source: fivethirtyeight::bechdel") +
  theme_bw(base_size = 16) +
  theme(plot.title = element_markdown())

goo <- ggplotly(gg_bechdel_for_plotly)

goo

goo$

goo$x$layout$yaxis %>%
  enframe() %>%
  filter(str_detect(name, "tick")) %>%
  View()

bechdel %>%
  drop_na(budget_2013) %>%
  plot_ly(x = ~budget_2013,
          y = ~domgross_2013,
          color = ~ifelse(year > 2000, "Post-2020", "Pre-2020"),
          colors = c("cornflowerblue", "burlywood"),
          text = ~title,
          hovertemplate = paste(
            '<b>%{text}</b>',
            '<br><b>Budget</b>: %{y:$.1s}',
            '<br><b>Domestic Gross</b>: %{x:$.1s}<br>'
                                )) %>%
  layout(xaxis = list(title = "Movie Budget",
                      size = 20,
                      tickvals = c(0, 1e+08, 2e+08, 3e+08, 4e+08),
                      ticktext = c("$0 Million", "$100 Million", "$200 Million", "$300 Million",
                                   "$400 Million")
                      ),
         yaxis = list(title = "Movie Domestic Gross",
                      ticktext = c("$0 Million", "$500 Million", "$1,000 Million", "$1,500 Million"),
                      tickvals = c(0, 5e+08, 1e+09, 1.5e+09)),
         title = list(text = "Profitability of <span style='color:burlywood;font-weight:bold'>pre-2020</span> and <span style='color:cornflowerblue;font-weight:bold'>post-2020 movies</span>",
                      y = 0.99),
         font = list(size = 16))






