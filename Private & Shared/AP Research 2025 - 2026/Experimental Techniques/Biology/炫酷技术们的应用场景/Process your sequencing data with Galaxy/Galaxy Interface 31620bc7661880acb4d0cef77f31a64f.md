# Galaxy Interface

![1772513231546.png](Galaxy%20Interface/1772513231546.png)

# Activity Bar

![1772513324394.png](Galaxy%20Interface/1772513324394.png)

# Register, and Log in with your account

- So that you can save your workflow history
- Remember to activate your account using link in your mailbox after initial registration

# Homepage

- Click the Galaxy on the top-left of the page

![1772332382797.png](Galaxy%20Interface/1772332382797.png)

# History

- Location of all analyses
    - Collects all datasets produced by tools
    - Collects all operations performed on the data
- For each dataset (the heart of Galaxy’s reproducibility), the history tracks
    - name, format, size, creation time, datatype-specific metadata
    - tool id, version, inputs, parameters
    - standard output (`stdout`) and error (`stderr`)
    - state (waiting, running, success, failed)
    - hidden, deleted, purged
- You can have as many histories as you want
    - Each history should correspond to a different analysis
    - and should have a meaningful name
    
- Working process
    - Check the top-right corner of the page
    - Click the “+” button on the top-right to create new history for the workflow of a project
    - Click the pen button to re-name your history from “unnamed history”
    - Your uploaded file for this history will be shown below

![1772332717373.png](Galaxy%20Interface/1772332717373.png)

# Tools

- Check the column on the left of the page
- Scroll down the list, or type in the tool you need for processing your data

![1772332460834.png](Galaxy%20Interface/1772332460834.png)

## Tool interface

- A tool form contains:
    - input datasets and parameters
    - help, citations, metadata
    - a `run tool` button to start a job, which will add some output datasets to the history
- New tool versions can be installed without removing old ones to ensure reproducibility

![1772513484950.png](Galaxy%20Interface/1772513484950.png)

# Upload Data

- Check the column on the left of the page
- You may
    - upload local files from your computer
    - upload data from an internet URL
    - upload data from online databases: UCSC, BioMart, ENCODE, modENCODE, Flymine, etc.
    - Import from Shared Data (libraries, histories, pages)
    - Upload data from FTP
    
    ![1772514047346.png](Galaxy%20Interface/1772514047346.png)
    
- Make sure to click the “start” button for data upload to Galaxy. When it shows 100%, the upload is complete.

![1772332601146.png](Galaxy%20Interface/1772332601146.png)

## Data types

- Tools only accept input datasets with appropriate datatypes
- When uploading a dataset, its datatype can be either:
    - automatically detected
    - assigned by the user
- Datasets produced by a tool have their datatype assigned by the tool
- To change the datatype of a dataset, either:
    - Edit attributes and Datatypes (if original wrong), or
    - Edit attributes and Convert

[Commonly seen datatypes](Galaxy%20Interface/Commonly%20seen%20datatypes%2031820bc7661880eda799fcfcf369d50d.md)

## Reference datasets

### Example: reference genome

- Genome build specifies which genome assembly a dataset is associated with
    - e.g. mm10, hg38, …
- Can be assigned by a tool or by the user
- Users can create custom genome builds
- New builds can be added by the admin

![1772514323335.png](Galaxy%20Interface/1772514323335.png)

# Workflow Editor

- Extracted from a history
- Built manually by adding and configuring tools using the canvas
- Imported using an existing shared workflow
    
    ![RNA-Seq_workflow_editing.png](Galaxy%20Interface/RNA-Seq_workflow_editing.png)
    

### Why would you want to create workflows?

- Re-run the same analysis on different input datasets
- Change parameters before re-running a similar analysis
- Make use of the workflow job scheduling
    - jobs are submitted as soon as their inputs are ready
- Create sub-workflows: a workflow inside another workflow
- Share workflows for publication and with the community

# Visualizations

- Datatypes know what tools can be used to visualize datasets:
    - Sequencing data has a button for visualizing in IGV
    - Tabular data will prompt you to build charts
    - Protein data can be seen in a 3D viewer
- Interactive environments: Jupyter, RStudio, etc.

![charts_examples2.png](Galaxy%20Interface/charts_examples2.png)