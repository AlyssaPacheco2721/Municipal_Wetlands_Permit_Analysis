r

# Wetlands Permit Analysis
# Author: Alyssa
# Description: Mock municipal wetlands permit tracking analysis

install.packages(c("tidyverse", "lubridate"))
library(tidyverse)
library(lubridate)

set.seed(123)

permit_data <- tibble(
  permit_id = 1:120,
  permit_type = sample(
    c("NOI", "RDA", "ANRAD"),
    120,
    replace = TRUE,
    prob = c(0.3, 0.5, 0.2)
  ),
  wetland_type = sample(c("BVW", "Salt Marsh", "Riverfront"), 120, replace = TRUE),
  status = sample(c("Pending", "Approved", "Expired"), 120, replace = TRUE),
  date_submitted = sample(seq(as.Date("2024-01-01"), as.Date("2024-12-31"), by = "day"), 120)
) %>%
  mutate(
    review_days = sample(14:180, n(), replace = TRUE),
    date_decided = date_submitted + lubridate::days(review_days)
  )
permit_data <- permit_data %>%
  relocate(review_days, .after = last_col())

View(permit_data)

#-------------Table Summary------------------------------------------------

permit_type_summary <- permit_data %>%
  count(permit_type) %>%
  mutate(percent = round(n / sum(n) * 100, 1)) %>%
  arrange(desc(n))

View(permit_type_summary)

#-------------Bar Chart------------------------------------------------

permit_type_plot <- ggplot(
  permit_type_summary,
  aes(x = reorder(permit_type, -n), y = n, fill = permit_type)
) +
  geom_col(show.legend = FALSE) +
  geom_text(
    aes(label = n),
    vjust = -0.4,
    size = 3.5
  ) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Permit Volume by Permit Type",
    x = "Permit Type",
    y = "Number of Permits"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5)
  )

permit_type_plot
----------------------------------------------------------------------
#RDAs account for approximately 52% of all wetlands permits in this dataset,
#indicating that staff workload is primarily driven by determination requests. 
#NOIs represent just under one-third of permit activity, while ANRAD filings 
#comprise a smaller but consistent share of overall workload.”
----------------------------------------------------------------------

review_time_summary <- permit_data %>%
  group_by(permit_type) %>%
  summarise(
    permits = n(),
    avg_days = round(mean(review_days), 1),
    median_days = round(median(review_days), 1),
    min_days = min(review_days),
    max_days = max(review_days)
  ) %>%
  arrange(desc(avg_days))

View(review_time_summary)

#------------------Box Plot------------------------------------------------

review_time_plot <- ggplot(
  permit_data,
  aes(x = permit_type, y = review_days, fill = permit_type)
) +
  geom_boxplot(width = 0.6, show.legend = FALSE) +
    scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Wetlands Permit Review Time by Permit Type",
    x = "Permit Type",
    y = "Review Time (Days)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5)
  )

review_time_plot

--------------------------------------------------------------------

long_reviews <- permit_data %>%
  filter(review_days > 120) %>%
  arrange(desc(review_days))

View(long_reviews)
----------------------------------------------------------------------
#Average review times are similar across permit types, suggesting that overall 
#review duration is influenced more by process and workload factors than by 
#permit category alone. NOI filings show consistently longer review times, 
#while RDAs exhibit greater variability, with a subset of complex cases 
#extending review duration. Maximum review times approach 180 days across all 
#permit types, indicating that extended reviews are not isolated to a single 
#category.
------------------------------------------------------------------------


