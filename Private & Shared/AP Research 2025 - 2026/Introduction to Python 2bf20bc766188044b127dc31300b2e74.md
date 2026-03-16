# Introduction to Python

# What is Python?

---

- A general-purpose ****programming language like JavaScript, C++, etc.
- An **interpreted language**.
- Typically used for **web development**, **automation/scripting**, and **data science**, making it exceptionally versatile for a wide range of fields.
    - E.g.
        - **Backend Web Development** (using frameworks like Django and Flask)
        - **Machine Learning/AI** (using libraries like TensorFlow and PyTorch)
        - **Data Analysis & Visualization** (using libraries like Pandas and Matplotlib)
        - **Automation/Scripting** (creating simple programs to manage files or perform repetitive tasks)
        - **Scientific Computing** (using NumPy for complex mathematical operations)
- Also applicable for game development, desktop applications, embedded systems, and anything requiring a clear, readable, and adaptable language.

# When do we choose Python?

---

- Choose **Python** for modelling and more complex and creative algorithms (general-purpose language)
- Choose **R** when there is large amount of statistical analysis and data visualization (faster)

# How to install [Python](https://www.python.org/) on your device?

---

## Software Download

1. [Download **Python](https://www.python.org/downloads/)** (the language). 

![1765244756514.png](Introduction%20to%20Python/1765244756514.png)

![1765244791455.png](Introduction%20to%20Python/1765244791455.png)

1. [Download Visual Studio Code](https://code.visualstudio.com/) (one of the integrated development environments for computation. You may also choose [Pycharm](https://www.jetbrains.com/pycharm/)). This is the software to be run each time you type python commands.
    
    ![1765244988290.png](Introduction%20to%20Python/1765244988290.png)
    
    ![1765245044645.png](Introduction%20to%20Python/1765245044645.png)
    

1. Installing the Extensions in VS Code.
    - Open VS Code.Click the **Extensions** icon (the four squares on the sidebar, or press `Ctrl + Shift + X` / `Cmd + Shift + X`).
    - Search for **"Python"** (published by Microsoft) and click **Install**.
        - This extension provides IntelliSense, debugging, and environment management.
    - Search for “**Jupyter**” and click Install.
        - Install this one if you plan to use data science tools or interactive notebooks
        - Be sure that your device is equipped with `ipykernel` (the kernel for Jupyter) ([Source Page](https://ipython.readthedocs.io/en/stable/install/kernel_install.html)).
            
            ```python
            # 在cmd或terminal中输入以下命令来查看已安装的package列表
            pip list
            
            # 若尚未安装ipykernel，输入以下命令安装
            pip install ipykernel
            ipykernel install --user
            
            # 更新ipykernel version
            pip install --upgrade ipykernel
            ```
            

# Configuration of the Python Environment in [VSCode](https://code.visualstudio.com/)

---

- Use a Virtual Environment (`venv`) for every project. A `venv` isolates your project's dependencies (packages) from other projects and your main system Python installation, preventing conflicts.
    
    
    | **Step** | **Windows (Command Prompt/PowerShell)** | **macOS/Linux (Terminal)** |
    | --- | --- | --- |
    | **1. Create Project Folder** | `mkdir my_python_project` | `mkdir my_python_project` |
    |  | `cd my_python_project` | `cd my_python_project` |
    | **2. Create Virtual Env** | `python -m venv .venv` | `python3 -m venv .venv` |
    | **3. Activate Virtual Env** | **`.\.venv\Scripts\activate`** | **`source .venv/bin/activate`** |
    | **4. Install Packages** | `pip install requests pandas` | `pip install requests pandas` |
- Connecting your VSCode to the Environment.
    - Open your project folder in VS Code (**File > Open Folder...**).
    - In the bottom-right corner of the VS Code window, you'll see the currently selected Python interpreter (it might say "No Interpreter"). **Click this text.**
    - A list of interpreters will appear at the top. Select the one that includes the path to your newly created virtual environment (it will usually be labeled **`.venv`** or something similar to `.\.venv\Scripts\python.exe`).
    - Once selected, the bottom-right corner will update to show the active virtual environment.

# Create a virtual environment for coding

## In Windows

- Open `cmd`

```bash
python -m venv C:\my-envs\project-env   # 使用绝对路径
C:\my-envs\project-env\Scripts\activate   # 激活虚拟环境

(my-env) python -m pip install ipython numpy matplotlib
(my-env) ipython
```

## In MacOS / Linux

```bash
$ python -m venv ~/.my-env  # Create virtual environment in the main path
# $ python -m venv /opt/venvs/my_project_env  ## Create virtual environment in the chosen path "/opt/venvs/my_project_env"
$ source ~/.my-env/bin/activate

(my-env) $ python -m pip install ipython numpy matplotlib  # install the IPython console, Numpy and Matplotlib using pip
(my-env) $ ipython
```

# Start coding with Python in VSCode

---

- Below is the interface of VSCode when you create a new file (type [`filename.py`](http://filename.py) if you are creating a python script; type `filename.ipynb` if you are generating a python notebook script. [Check for the difference here.](https://stackoverflow.com/questions/57502484/what-is-the-difference-between-a-py-file-and-ipynb-file))
    
    ![image.png](Introduction%20to%20Python/c35f03fd-78ab-446e-8efc-529d294f42bb.png)
    
    ![image.png](Introduction%20to%20Python/184520dd-a0cc-414a-85dc-a08b76fc25ea.png)
    

## Work on each project with the corresponding virtual environment

- Open the project folder that contains your virtual environment (for example, named `my-env`) in VSCode.
- Press the shortcut `Ctrl+Shift+P` to open the Command Palette.
- Type and select **Python: Select Interpreter**.
- In the list that appears, find and choose your virtual environment. Its path typically looks like `./my-env/Scripts/python.exe` or `.\my-env\Scripts\python.exe`. If it’s not in the list, you can click "Enter interpreter path..." and manually browse to this file.
- After successful selection, the status bar in the bottom-left corner of VSCode will display something like `Python 3.x ('my-env': venv)`, indicating the switch was successful.
- If you want the terminal to always activate automatically, you can check the VSCode settings. Open settings (`Ctrl+,`), search for `python.terminal.activateEnvironment`, and make sure this option is **checked**. After that, opening a new terminal will automatically activate the environment.
    - To verify if the activation is successful:
        - Create a new Python file in VSCode (e.g., `test.py`).
        - Enter the following code and run it (click the triangular run button in the top-right corner):
            
            ```python
            import sys
            print(sys.executable)
            ```
            
        - If the output path points to your `my-env\Scripts\python.exe`, then the activation is successful.