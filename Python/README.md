# E-commerce Data Analysis

A Python data analysis project exploring e-commerce orders, products, sales quantities, returned items, and revenue.

## Project Contents

- `Decodelab Data.ipynb` - Main notebook for data cleaning, validation, exploratory analysis, charts, and statistics.
- `Data Analytic in Python.ipynb` - Additional data analysis practice.
- `Data with Baraa.ipynb` - Additional pandas practice.
- `matplotlib_tutorial.ipynb` - Matplotlib practice and examples.
- `Pandas with Alex.ipynb` - Pandas practice and examples.
- `note.md` - Supporting notes.
- `Python.md` - Python notes.

## Analysis Workflow

The main notebook includes:

1. Loading the e-commerce dataset
2. Standardizing column names
3. Checking duplicate records
4. Removing unnecessary columns
5. Formatting dates and numeric values
6. Filling missing values
7. Validating total prices
8. Comparing shipped and returned orders
9. Ranking products by quantity
10. Creating charts, boxplots, statistics, and a correlation heatmap

## Requirements

- Python 3
- Jupyter Notebook or Visual Studio Code with the Jupyter extension
- pandas
- NumPy
- Matplotlib
- Seaborn

Install the packages with:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

## Dataset Setup

The main notebook expects the dataset at this path:

```text
/Users/yezawmyint/My Project/E-commerce (decodelab)/Dataset for Data Analytics.csv
```

Before running the notebook, update the `file_path` variable in the setup cell to match the location of your CSV file:

```python
file_path = "path/to/Dataset for Data Analytics.csv"
```

## Run the Project

1. Open `Decodelab Data.ipynb` in Jupyter Notebook or VS Code.
2. Update `file_path` to point to the dataset.
3. Run the notebook cells from top to bottom.
4. Review the summary tables and visualizations.

## Notes

The dataset is not included in this repository. Keep private or sensitive data outside the repository and add it to `.gitignore` when needed.
