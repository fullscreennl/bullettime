class obID:
    pass

obID.__objID__ = 0

def next():
    obID.__objID__ += 1
    return obID.__objID__