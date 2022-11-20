'''
unit test sample
'''


def inc(value: int):
    '''
    increment value

    Args:
        value (int): _description_

    Returns:
        int: _description_
    '''
    return value + 1


def test_inc():
    '''
    test_answer
    >>> inc(3)
    >>> 4
    '''
    assert inc(3) == 4
