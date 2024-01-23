#!/usr/bin/env python
# coding: utf-8

# In[2]:


get_ipython().system('pip install --upgrade jupyterthemes')
import jupyterthemes as temas
get_ipython().system('jt -t oceans16 -T -N -kl')
get_ipython().system('jt -t monokai -f fira -fs 12 -nf ptsans -nfs 12 -N -kl -cursw 2 -cursc r -cellw 90% -ofs 12 -dfs 12 -T')

