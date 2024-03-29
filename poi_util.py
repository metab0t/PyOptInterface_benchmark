import numpy as np


def add_ndarray_variable(m, shape, **kwargs):
    array = np.empty(shape, dtype=object)
    array_flat = array.flat
    for i in range(array.size):
        array_flat[i] = m.add_variable(**kwargs)
    return array
