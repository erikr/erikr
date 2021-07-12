---
layout: post
title: Python style preferences
---

I have adopted the following Python style preferences, many of which are from working with the excellent engineers at the Broad Institute.  

1. Global variables are in upper-case, can be accessed anywhere within a script, and should be initialized at the top of the script.  
  
    Good global variables are paths to file names, e.g.  
    `FNAME_RESULTS = "./results"`.

    Minimize use of global variables.

2. Functions only called within a script are *private* functions, whereas scripts imported into other scripts are not private.  

    Private functions start with an underscore, e.g. `def _calculate_auc(args):` and `auc = _calculate_auc(args)`.  

    Non-private functions (e.g. those defined in `utils.py` that are used elsewhere via `from utils import func`) do not need an underscore, e.g. `load_data(args)`.

3. Use `logging.info(f"content")` instead of `print`.  

    Printing to the screen slows down scripts, so only do it when necessary. Most results and certainly figures should be saved in a file. Print the bare essentials to screen.  

4. Use f-strings, not %-strings:  

    ```
    print(f"classifier: {clf_name} / train AUC {auc_train}")
    ```

    %-strings are slower and less readable:  
    ```
    print("classifier: %s / train AUC %s " % (clf_name, auc_train))
    ```
    
4. Use double-quotes for strings, not single-quotes, e.g. `"this is good"` and `'this is bad'`. Other languages use double-quotes, and even within Python there are string formatting situations where double-quotes make life easier.  

5. Use type hints instead of verbose variable / argument names or function documentation. You can indicate types and default values in function definitions:  

    ```
    def calc_op_time(name: str = "bob", op_time: float = 60.0) -> str:
        new_val = str(op_time**2)
        return f"patient {name}'s op time squared is: {new_val}"
    ```