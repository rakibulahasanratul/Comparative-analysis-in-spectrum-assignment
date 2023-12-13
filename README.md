# Network Dataset Creation

## Steps for Generating Connection Requests

1. **Open Google Colab**
   - URL: [Google Colab](https://colab.research.google.com/)

2. **Upload Notebook**
   - Go to `File` --> `Upload Notebook` --> `Browse` and load the file `networkdata_creation.ipynb`.

3. **Modify Parameters**
   - Change the value in `random_pairs = generate_random_pairs(G,100)` to `40` or `100` for the connection request.

4. **Execute the Notebook**
   - Select `Runtime` --> `Run All`.

*Output*: Datasets for 40 and 100 connection requests for Python and Matlab interfaces.

## Dataset Files

- `40connectionrequest.txt`: Contains the 40 connection dataset.
- `100connectionrequest.txt`: Contains the 100 connection dataset.

## Generating Connection Request Results

### For 40 Connection Requests

- Python: `code_connection_request_40/genetic_algorithm_40connection.ipynb`
- Matlab: `code_connection_request_40/scheduleTasksDemoLF_40_connection_request.m`
- Matlab: `code_connection_request_40/scheduleTasksDemoWF_40_connection_request.m`

### For 100 Connection Requests

- Python: `code_connection_request_100/genetic_algorithm_100connection.ipynb`
- Matlab: `code_connection_request_100/scheduleTasksDemoLF_100_connection_request.m`
- Matlab: `code_connection_request_100/scheduleTasksDemoWF_100_connection_request.m`

### Python Instructions

1. **Open Google Colab**
   - URL: [Google Colab](https://colab.research.google.com/)

2. **Upload Notebook**
   - Go to `File` --> `Upload Notebook` --> `Browse` and load either `genetic_algorithm_40connection.ipynb` or `genetic_algorithm_100connection.ipynb`.

3. **Execute the Notebook**
   - Select `Runtime` --> `Run All`.

## Comparison of Results

- **Run the `summary.m` Matlab file**
  - This will produce the comparison results of LF, WF, and GA algorithms.

## Output Location

- All output results can be found in the `alloutputs` folder.
