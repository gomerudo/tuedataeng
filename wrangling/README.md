In this directory you will find the jupyter notebooks to do the cleaning and wrangling.

# Steps

1. You need to download the full dataset (from the links in the last latex report, the one with more than 6,000,000) [I remember some one was working with an smaller one].
2. Name the datasets `chicago_crimes_2001_present.csv` and `chicago_socioeconomic_indicators_2008_2012.csv`, respectively.
3. Open the `ChicagoCrimes_cleaning.ipynb` file and replace the variable `DATASET_CRIMES_PATH` with the path where the datasets are located.
4. Run all the cells of the `ChicagoCrimes_cleaning.ipynb`. This will create the clean datasets.
5. Open the `ChicagoCrimes_wrangling.ipynb` file and replace the variable `DATASET_CRIMES_PATH` again.
6. Run the notebook to create the `timewise_nodes.csv` file.

Make any other modification you consider necessary.