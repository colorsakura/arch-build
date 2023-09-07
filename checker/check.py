#!/bin/python

class Checker:
    def __init__(self):
        pass

    def _is_git(self, pkg):
        '''Check the package is git or not
        '''
        if pkg.endswith('-git'):
            return True
        return False

    def _check_sum(self, pkg):
        pass

    def check(self, pkg):
        '''Check the package is updated or not
        '''
        if self._is_git(pkg):
            return True
    
    def _update(self):
        pass
        

if __name__ == '__main__':
    pass