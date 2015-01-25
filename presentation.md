---
title: "Data Project Presentation"
author: "Klerisson Paixao"
date: "Thursday, January 22, 2015"
output: ioslides_presentation
runtime: shiny
mode: selfcontained
url: {lib: ../libraries}
---

## Shiny Presentation

This R Markdown presentation about the interactive NOOA data set.
Goal of this report is to idenify severe weather events of the highest impact on both US population and US economy based on the information retrieved from U.S. National Oceanic and Atmospheric Administration's (NOAA) storm database.

## Data set
Database version used for this report contain entries for years 1950-2011. 
See following the five firts rows:




```r
head(dt, 5)
```

```
##    YEAR   STATE  EVTYPE COUNT FATALITIES INJURIES PROPDMG CROPDMG
## 1: 1950 alabama tornado     2          0       15 0.02750       0
## 2: 1951 alabama tornado     5          0       13 0.03500       0
## 3: 1952 alabama tornado    13          6      116 5.45250       0
## 4: 1953 alabama tornado    22         16      248 3.07000       0
## 5: 1954 alabama tornado    10          0       36 0.60753       0
```

## NOOA Events plot


```
## Error in eval(expr, envir, enclos): could not find function "inputPanel"
```

```
## Error in eval(expr, envir, enclos): could not find function "reactiveValues"
```

```
## Error in values$evtypes <- evtypes: object 'values' not found
```

```
## Error in eval(expr, envir, enclos): could not find function "reactive"
```

```
## Error in eval(expr, envir, enclos): could not find function "renderPlot"
```

## Results

Most of the observed differences can be attributed to the differences in the size of the samples. Nevertheless I was able to identift four types of events which had both high normalized average and maximum impact and should be considered highly harmful:

- Surge
- Heat / Heat Wave
- Tropical storm
- Tsunami
