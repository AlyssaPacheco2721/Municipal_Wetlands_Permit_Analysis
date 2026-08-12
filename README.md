# Municipal Wetlands Permit Review Analysis

An exploratory environmental data analysis examining municipal wetlands permit activity, review timelines, and workload patterns using R.

## Project Overview

This project uses a simulated dataset of 120 municipal wetlands permit records to explore patterns in permit volume and review duration across different permit types.

The analysis was designed to demonstrate how environmental and municipal data can be organized, analyzed, and visualized to support evidence-based review and decision-making.

## Research Questions

- What types of wetlands permits make up the largest share of municipal review activity?
- How do review timelines vary among permit types?
- Which permit categories show the greatest variability in review duration?
- What patterns could help inform workload planning and permit review processes?

## Tools & Skills

- R
- RStudio
- tidyverse
- Data wrangling
- Descriptive statistics
- Grouped data analysis
- Data visualization
- Environmental data analysis

## Dataset

The project uses a simulated dataset containing 120 municipal wetlands permit records.

Variables include permit type, wetland resource category, application and decision dates, permit status, and calculated review duration.

The dataset is simulated for portfolio and analytical practice and does not represent records from an actual municipality.

## Analysis

The analysis summarizes permit activity by type and evaluates differences in review timelines using grouped summary statistics and visualizations.

Outputs include:

- Permit volume by application type
- Review-time summary statistics
- Permit volume summary tables
- Review-time boxplots comparing permit categories

## Key Findings

- Requests for Determination of Applicability (RDAs) represented the largest share of simulated permit activity.
- Notice of Intent (NOI) applications had somewhat longer average review times.
- RDA review times showed greater variability.
- Longer individual review periods may reflect case-specific factors rather than permit type alone.

## Repository Contents

- `wetlands_permits.R` — R code used for the analysis
- `figures/` — data visualizations produced during the analysis
- `outputs/` — summary tables
- `report/` — completed project report
- `wetlands_permit_analysis.Rproj` — RStudio project file

## Future Development

Future versions of this project could incorporate additional variables and statistical methods to investigate factors associated with permit review duration and move from descriptive analysis toward predictive modeling.
