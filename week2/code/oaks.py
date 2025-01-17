#!/usr/bin/env ipython3

"""This script shows examples of loops and list comprehensions."""

__appname__ = 'oaks.py'
__author__ = 'Amy Feakes (amf222@ic.ac.uk)'
__version__ = '0.0.1'


## Finds just those taxa that are oak trees form a list of

taxa = [ 'Quercus robur',
         'Fraxinus excelsior',
         'Pinus sylvestris',
         'Quercus cerris',
         'Quercus petraea'
         ]
def is_an_oak(name): #only oak species that start w Quercus are returned
    """ Only species starting with quercus will be returned"""
    return name.lower().startswith('quercus ')

#using for loops 
oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species)
print(oaks_loops)

#using list comprehensions 
oaks_lc = set([species for species in taxa if is_an_oak(species)])
print(oaks_lc)

#get names in uppercase using for loops 
oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species.upper()) #changes to uppercase
print(oaks_loops)

#get names in uppercase using for list comprehensions 
oaks_lc = set([species.upper() for species in taxa if is_an_oak(species)])
print(oaks_lc)