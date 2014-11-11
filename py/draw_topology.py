##this is /ci2014/py/draw_topology
import sys
import traceback

import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
import matplotlib.tri as Tri

import numpy as np

import pyugrid

import netCDF4

# url="http://comt.sura.org/thredds/dodsC/data/comt_1_archive/inundation_extratropical/UMASS_FVCOM/2005_3D_final_run_with_waves"

url="http://comt.sura.org/thredds/dodsC/data/comt_1_archive/inundation_tropical/USF_FVCOM/Hurricane_Ike_2D_final_run_with_waves"

try:
    ug = pyugrid.UGrid.from_ncfile(url)
    lon = ug.nodes[:,0]
    lat = ug.nodes[:,1]
    nv  = ug.faces[:]

    # triangles = Tri.Triangulation(lon,lat,triangles=nv)
    # print triangles.shape
except:
    print 'not ugrid'
    exc_type, exc_value, exc_traceback = sys.exc_info()
    print repr(traceback.format_exception(exc_type, exc_value, exc_traceback))

m = Basemap(llcrnrlon=-100.,llcrnrlat=0.,urcrnrlon=-20.,urcrnrlat=57.,
            projection='lcc',lat_1=20.,lat_2=40.,lon_0=-60.,
            resolution ='l',area_thresh=1000.)

xpt,ypt=m(lon,lat)

m.drawcoastlines()
m.drawcountries()
m.drawmapboundary(fill_color='#99ffff')

m.fillcontinents(color='#cc9966',
                 lake_color='#99ffff')


# print triangles[:20]
# m.plot(xpt,ypt,'bo')
plt.triplot(xpt,ypt,nv,
            linestyle='-',
            linewidth=1,
            color="#FF0000",
            # color="#66cccc",
            marker='o',
            markersize=2,
            markerfacecolor='#666666')
            

plt.show()
