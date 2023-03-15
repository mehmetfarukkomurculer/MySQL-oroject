

import numpy as np
import pandas as pd

import sys

#   Usage:
#       * change directory to director that contains all csv files
#       * execute script as: MergeAndFormat <output> <input 1> <input 2> <input *>

fn = sys.argv
outn = fn[1]
fn.pop(0)
fn.pop(0)

dfs = [None] * len(fn)
for i in range(len(fn)):
    dfs[i] = pd.read_csv(fn[i])

left = dfs[0]
dfs.pop(0)
for right in dfs:
    left = pd.merge(
        left,
        right,
        how="inner",
        on=None,
        left_on=None,
        right_on=None,
        left_index=False,
        right_index=False,
        sort=True,
        suffixes=("_x", "_y"),
        copy=True,
        indicator=False,
        validate=None,
    )

left.drop("Entity", axis=1, inplace=True)
left.to_csv(outn, sep=";", na_rep="Null", decimal=",")
